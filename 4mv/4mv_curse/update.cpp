#include "update.h"
#include "ui_update.h"

Update::Update(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Update)
{
    ui->setupUi(this);
}

void Update::accept()
{
    QString
        name = ui->textEdit->toPlainText(),
        sex = ui->textEdit_2->toPlainText(),
        phone = ui->textEdit_3->toPlainText(),
        reg_date = ui->textEdit_4->toPlainText();
    int num = ui->textEdit_7->toPlainText().toInt();
    QSqlQuery query(db);
    query.exec("SELECT num FROM clients WHERE num > 0");
    query.last();
    int _max_num = query.at() + 1;
    if (num > _max_num)
    {
        QMessageBox::information(0, "Status", "Некорректный номер");
    }
    else if (name == "\0" or sex == "\0" or phone == "\0" or reg_date == "\0")
    {
        QMessageBox::information(0, "Status", "Некорректный ввод");
    }
    else
    {
        query.prepare("UPDATE clients SET name = :name, sex = :sex, phone = :phone, reg_date = :reg_date WHERE num = :num");
        query.bindValue(":name", name);
        query.bindValue(":sex", sex);
        query.bindValue(":phone", phone);
        query.bindValue(":reg_date", reg_date);
        query.bindValue(":num", num);
        query.exec();
    }
}

Update::~Update()
{
    delete ui;
}
