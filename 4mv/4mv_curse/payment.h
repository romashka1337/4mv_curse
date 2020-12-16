#ifndef PAYMENT_H
#define PAYMENT_H

#include "stdafx.h"

namespace Ui {
class Payment;
}

class Payment : public QDialog
{
    Q_OBJECT

public:
    explicit Payment(QWidget *parent = nullptr);
    ~Payment();

public slots:
    void accept();

private:
    Ui::Payment *ui;
};

#endif // PAYMENT_H
