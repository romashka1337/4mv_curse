#ifndef UPDATE_H
#define UPDATE_H

#include "stdafx.h"

namespace Ui {
class Update;
}

class Update : public QDialog
{
    Q_OBJECT

public:
    explicit Update(QWidget *parent = nullptr);
    ~Update();

public slots:
    void accept();

private:
    Ui::Update *ui;
};

#endif // UPDATE_H
