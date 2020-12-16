#include "payment.h"
#include "ui_payment.h"

Payment::Payment(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Payment)
{
    ui->setupUi(this);
}

void Payment::accept()
{
    QString
        pay_date = ui->textEdit_2->toPlainText(),
        pay_duration = ui->textEdit_3->toPlainText();
    int num = ui->textEdit->toPlainText().toInt();
    QSqlQuery query(db);
    query.exec("SELECT num FROM clients WHERE num > 0");
    query.last();
    int _max_num = query.at() + 1;
    qDebug() << _max_num << num;
    if (num > _max_num)
    {
        QMessageBox::information(0, "Status", "Некорректный номер");
    }
    else if (pay_date == "\0" or pay_duration == "\0")
    {
        QMessageBox::information(0, "Status", "Некорректный ввод");
    }
    else
    {
        query.prepare("UPDATE clients SET pay_date = :pay_date, pay_duration = :pay_duration WHERE num = :num");
        query.bindValue(":pay_date", pay_date);
        query.bindValue(":pay_duration", pay_duration);
        query.bindValue(":num", num);
        query.exec();
    }
}

Payment::~Payment()
{
    delete ui;
}
