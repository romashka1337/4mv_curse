#ifndef FAQ_H
#define FAQ_H

#include "stdafx.h"

namespace Ui {
class FAQ;
}

class FAQ : public QDialog
{
    Q_OBJECT

public:
    explicit FAQ(QWidget *parent = nullptr);
    ~FAQ();

private:
    Ui::FAQ *ui;
};

#endif // FAQ_H
