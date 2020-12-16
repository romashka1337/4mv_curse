#ifndef DELETE_H
#define DELETE_H

#include "stdafx.h"

namespace Ui {
class Delete;
}

class Delete : public QDialog
{
    Q_OBJECT

public:
    explicit Delete(QWidget *parent = nullptr);
    ~Delete();

public slots:
    void accept();

private:
    Ui::Delete *ui;
};

#endif // DELETE_H
