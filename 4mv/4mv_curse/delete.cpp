#include "delete.h"
#include "ui_delete.h"

Delete::Delete(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Delete)
{
    ui->setupUi(this);
}

void Delete::accept()
{
    int num = ui->textEdit->toPlainText().toInt();

    QSqlQuery query(db);
    query.exec("SELECT num FROM clients WHERE num > 0");
    query.last();
    int _max_num = query.at() + 1;
    if (num > _max_num)
    {
        QMessageBox::information(0, "Status", "Некорректный номер");
    }
    else
    {
        query.prepare("DELETE FROM clients WHERE num = (?)");
        query.addBindValue(num);
        query.exec();
        for (auto it = 1; it <= _max_num; ++it)
        {
            if (it >= num)
            {
                query.prepare("UPDATE clients SET num = (?) WHERE num = (?)");
                query.addBindValue(it - 1);
                query.addBindValue(it);
                query.exec();
            }
        }
    }
}

Delete::~Delete()
{
    delete ui;
}
