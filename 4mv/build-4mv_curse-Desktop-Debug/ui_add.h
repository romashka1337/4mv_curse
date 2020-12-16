/********************************************************************************
** Form generated from reading UI file 'add.ui'
**
** Created by: Qt User Interface Compiler version 5.12.8
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_ADD_H
#define UI_ADD_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QLabel>
#include <QtWidgets/QTextEdit>

QT_BEGIN_NAMESPACE

class Ui_Add
{
public:
    QDialogButtonBox *buttonBox;
    QLabel *label;
    QLabel *label_2;
    QLabel *label_3;
    QLabel *label_4;
    QTextEdit *textEdit;
    QTextEdit *textEdit_2;
    QTextEdit *textEdit_3;
    QTextEdit *textEdit_4;

    void setupUi(QDialog *Add)
    {
        if (Add->objectName().isEmpty())
            Add->setObjectName(QString::fromUtf8("Add"));
        Add->resize(368, 208);
        buttonBox = new QDialogButtonBox(Add);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(0, 170, 331, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        label = new QLabel(Add);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(10, 10, 67, 31));
        label_2 = new QLabel(Add);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setGeometry(QRect(10, 50, 67, 31));
        label_3 = new QLabel(Add);
        label_3->setObjectName(QString::fromUtf8("label_3"));
        label_3->setGeometry(QRect(10, 90, 67, 31));
        label_4 = new QLabel(Add);
        label_4->setObjectName(QString::fromUtf8("label_4"));
        label_4->setGeometry(QRect(10, 130, 141, 31));
        textEdit = new QTextEdit(Add);
        textEdit->setObjectName(QString::fromUtf8("textEdit"));
        textEdit->setGeometry(QRect(160, 10, 201, 31));
        textEdit_2 = new QTextEdit(Add);
        textEdit_2->setObjectName(QString::fromUtf8("textEdit_2"));
        textEdit_2->setGeometry(QRect(160, 50, 201, 31));
        textEdit_3 = new QTextEdit(Add);
        textEdit_3->setObjectName(QString::fromUtf8("textEdit_3"));
        textEdit_3->setGeometry(QRect(160, 90, 201, 31));
        textEdit_4 = new QTextEdit(Add);
        textEdit_4->setObjectName(QString::fromUtf8("textEdit_4"));
        textEdit_4->setGeometry(QRect(160, 130, 201, 31));

        retranslateUi(Add);
        QObject::connect(buttonBox, SIGNAL(accepted()), Add, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), Add, SLOT(reject()));

        QMetaObject::connectSlotsByName(Add);
    } // setupUi

    void retranslateUi(QDialog *Add)
    {
        Add->setWindowTitle(QApplication::translate("Add", "Add", nullptr));
        label->setText(QApplication::translate("Add", "\320\244\320\230\320\236", nullptr));
        label_2->setText(QApplication::translate("Add", "\320\277\320\276\320\273", nullptr));
        label_3->setText(QApplication::translate("Add", "\321\202\320\265\320\273\320\265\321\204\320\276\320\275", nullptr));
        label_4->setText(QApplication::translate("Add", "\320\264\320\260\321\202\320\260 \321\200\320\265\320\263\320\270\321\201\321\202\321\200\320\260\321\206\320\270\320\270", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Add: public Ui_Add {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_ADD_H
