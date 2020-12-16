#include "add.h"
#include "ui_add.h"

Add::Add(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Add)
{
    ui->setupUi(this);
}

void Add::accept()
{
    QString
        name = ui->textEdit->toPlainText(),
        sex = ui->textEdit_2->toPlainText(),
        phone = ui->textEdit_3->toPlainText(),
        reg_date = ui->textEdit_4->toPlainText();
    if (name == "\0" or sex == "\0" or phone == "\0" or reg_date == "\0")
    {
        QMessageBox::information(0, "Status", "Некорректный ввод");
    }
    else
    {
        QSqlQuery query(db);
        query.exec("SELECT num FROM clients WHERE num > 0");
        query.last();
        int num = query.at() + 2;
        query.prepare("INSERT INTO clients (num, name, sex, phone, reg_date, pay_date, pay_duration) VALUES (?, ?, ?, ?, ?, '', 0)");
        query.addBindValue(num);
        query.addBindValue(name);
        query.addBindValue(sex);
        query.addBindValue(phone);
        query.addBindValue(reg_date);
        query.exec();
    }
}

Add::~Add()
{
    delete ui;
}
