#ifndef ADD_H
#define ADD_H

#include "stdafx.h"

namespace Ui {
class Add;
}

class Add : public QDialog
{
    Q_OBJECT

public:
    explicit Add(QWidget *parent = nullptr);
    ~Add();

public slots:
    void accept();

private:
    Ui::Add *ui;
};

#endif // ADD_H
