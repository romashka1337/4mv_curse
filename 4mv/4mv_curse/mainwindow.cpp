#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QMenu *pmnuHelp = new QMenu("&Помощь");
    pmnuHelp->addAction(
        "&Помощь",
        this,
        SLOT(slotHelp()),
        QKeySequence(Qt::Key_F1)
    );
    menuBar()->addMenu(pmnuHelp);

    bg.addButton(ui->checkBox, 1);
    bg.addButton(ui->checkBox_2, 2);
    bg.addButton(ui->checkBox_3, 3);
    bg.addButton(ui->checkBox_4, 4);
    bg.addButton(ui->checkBox_5, 5);
    bg.addButton(ui->checkBox_6, 6);
    bg.addButton(ui->checkBox_7, 7);
    bg.addButton(ui->checkBox_8, 8);
    bg.addButton(ui->checkBox_9, 9);
    ui->checkBox->setVisible(false);
    ui->checkBox_2->setVisible(false);
    ui->checkBox_3->setVisible(false);
    ui->checkBox_4->setVisible(false);
    ui->checkBox_5->setVisible(false);
    ui->checkBox_6->setVisible(false);
    ui->checkBox_7->setVisible(false);
    ui->checkBox_8->setVisible(false);
    ui->label->setVisible(false);
    ui->label_2->setVisible(false);
    ui->textEdit_2->setVisible(false);
    ui->textEdit_3->setVisible(false);
    ui->columnView->setVisible(false);

    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("../clients.db");
    if (db.open()) {
        model = new QSqlTableModel(parent, db);
        model->setTable("clients");
        model->setHeaderData(0, Qt::Horizontal, tr("#"));
        model->setHeaderData(1, Qt::Horizontal, tr("ФИО"));
        model->setHeaderData(2, Qt::Horizontal, tr("пол"));
        model->setHeaderData(3, Qt::Horizontal, tr("телефон"));
        model->setHeaderData(4, Qt::Horizontal, tr("регистрация"));
        model->setHeaderData(5, Qt::Horizontal, tr("дата оплаты"));
        model->setHeaderData(6, Qt::Horizontal, tr("длительность"));
        model->select();
        ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::ResizeToContents);
        ui->tableView->horizontalHeader()->setStretchLastSection(true);
        ui->tableView->setModel(model);
        ui->tableView->show();
    }
    QTimer *timer = new QTimer(this);
    connect(timer, &QTimer::timeout, [&](){model->select();} );
    timer->start(1000);
}

void MainWindow::slotHelp()
{
    FAQ *faq = new FAQ();
    faq->show();
}

void MainWindow::on_pushButton_clicked()
{
    QString str = ui->textEdit->toPlainText();
    QString search = "\0";
    model->setTable("clients");
    if (ui->checkBox->isChecked()) search += "name = ";
    if (ui->checkBox_2->isChecked()) search += "sex = ";
    if (ui->checkBox_3->isChecked()) search += "phone = ";
    if (ui->checkBox_4->isChecked()) search += "reg_date = ";
    if (ui->checkBox_5->isChecked()) search += "duration = ";
    if (ui->checkBox_6->isChecked()) search += "payment = ";
    search += '\'' + str + '\'';
    if (ui->checkBox_7->isChecked())
    {
//        model->setTable("payment");
        QString
            begin = ui->textEdit_2->toPlainText(),
            end = ui->textEdit_3->toPlainText();
//        model->select();
        search = "date(pay_date) >= date('" + begin + "') AND date(pay_date) <=  date('" + end + "')";
    }
    if (ui->checkBox_8->isChecked()) {
        QString
            begin = ui->textEdit_2->toPlainText(),
            end = ui->textEdit_3->toPlainText();
        search = "date(reg_date) >= date('" + begin + "') AND date(reg_date) <=  date('" + end + "')";
    }
    if (ui->checkBox_9->isChecked())
    {
        ui->textEdit->setText("");
        search = "";
    }

    model->setHeaderData(0, Qt::Horizontal, tr("#"));
    model->setHeaderData(1, Qt::Horizontal, tr("ФИО"));
    model->setHeaderData(2, Qt::Horizontal, tr("пол"));
    model->setHeaderData(3, Qt::Horizontal, tr("телефон"));
    model->setHeaderData(4, Qt::Horizontal, tr("регистрация"));
    model->setHeaderData(5, Qt::Horizontal, tr("дата оплаты"));
    model->setHeaderData(6, Qt::Horizontal, tr("длительность"));
    model->setFilter(search);
    model->select();
}

void MainWindow::on_pushButton_2_clicked()
{
    Add *add = new Add();
    add->show();
}

void MainWindow::on_pushButton_3_clicked()
{
    Update *update = new Update();
    update->show();
}

void MainWindow::on_pushButton_4_clicked()
{
    Delete *_delete = new Delete();
    _delete->show();
}

void MainWindow::on_pushButton_5_clicked()
{
    Payment *payment= new Payment();
    payment->show();
}

void MainWindow::on_pushButton_6_clicked()
{
    if (not hidden)
    {
        ui->checkBox->setVisible(false);
        ui->checkBox_2->setVisible(false);
        ui->checkBox_3->setVisible(false);
        ui->checkBox_4->setVisible(false);
        ui->checkBox_5->setVisible(false);
        ui->checkBox_6->setVisible(false);
        ui->checkBox_7->setVisible(false);
        ui->checkBox_8->setVisible(false);
        ui->label->setVisible(false);
        ui->label_2->setVisible(false);
        ui->textEdit_2->setVisible(false);
        ui->textEdit_3->setVisible(false);
        ui->columnView->setVisible(false);
        ui->pushButton_6->setText(">>");
        ui->tableView->move(80, 70);
        ui->tableView->resize(641, 421);
        hidden = true;
    }
    else
    {
        ui->checkBox->setVisible(true);
        ui->checkBox_2->setVisible(true);
        ui->checkBox_3->setVisible(true);
        ui->checkBox_4->setVisible(true);
        ui->checkBox_5->setVisible(true);
        ui->checkBox_6->setVisible(true);
        ui->checkBox_7->setVisible(true);
        ui->checkBox_8->setVisible(true);
        ui->label->setVisible(true);
        ui->label_2->setVisible(true);
        ui->textEdit_2->setVisible(true);
        ui->textEdit_3->setVisible(true);
        ui->columnView->setVisible(true);
        ui->pushButton_6->setText("<<");
        ui->tableView->move(80, 240);
        ui->tableView->resize(641, 251);
        hidden = false;
    }

}

MainWindow::~MainWindow()
{
    db.close();
    delete ui;
}

