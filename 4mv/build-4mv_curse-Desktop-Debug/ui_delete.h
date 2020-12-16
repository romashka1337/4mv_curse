/********************************************************************************
** Form generated from reading UI file 'delete.ui'
**
** Created by: Qt User Interface Compiler version 5.12.8
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DELETE_H
#define UI_DELETE_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QLabel>
#include <QtWidgets/QTextEdit>

QT_BEGIN_NAMESPACE

class Ui_Delete
{
public:
    QDialogButtonBox *buttonBox;
    QLabel *label;
    QTextEdit *textEdit;

    void setupUi(QDialog *Delete)
    {
        if (Delete->objectName().isEmpty())
            Delete->setObjectName(QString::fromUtf8("Delete"));
        Delete->resize(268, 93);
        buttonBox = new QDialogButtonBox(Delete);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(10, 50, 231, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        label = new QLabel(Delete);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(10, 10, 67, 31));
        textEdit = new QTextEdit(Delete);
        textEdit->setObjectName(QString::fromUtf8("textEdit"));
        textEdit->setGeometry(QRect(90, 10, 161, 31));

        retranslateUi(Delete);
        QObject::connect(buttonBox, SIGNAL(accepted()), Delete, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), Delete, SLOT(reject()));

        QMetaObject::connectSlotsByName(Delete);
    } // setupUi

    void retranslateUi(QDialog *Delete)
    {
        Delete->setWindowTitle(QApplication::translate("Delete", "Delete", nullptr));
        label->setText(QApplication::translate("Delete", "\320\275\320\276\320\274\320\265\321\200", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Delete: public Ui_Delete {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DELETE_H
