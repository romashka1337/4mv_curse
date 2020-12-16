/********************************************************************************
** Form generated from reading UI file 'payment.ui'
**
** Created by: Qt User Interface Compiler version 5.12.8
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_PAYMENT_H
#define UI_PAYMENT_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QLabel>
#include <QtWidgets/QTextEdit>

QT_BEGIN_NAMESPACE

class Ui_Payment
{
public:
    QDialogButtonBox *buttonBox;
    QLabel *label;
    QLabel *label_2;
    QLabel *label_3;
    QTextEdit *textEdit;
    QTextEdit *textEdit_2;
    QTextEdit *textEdit_3;

    void setupUi(QDialog *Payment)
    {
        if (Payment->objectName().isEmpty())
            Payment->setObjectName(QString::fromUtf8("Payment"));
        Payment->resize(465, 172);
        buttonBox = new QDialogButtonBox(Payment);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(10, 130, 441, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        label = new QLabel(Payment);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(20, 10, 121, 31));
        label_2 = new QLabel(Payment);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setGeometry(QRect(20, 50, 121, 31));
        label_3 = new QLabel(Payment);
        label_3->setObjectName(QString::fromUtf8("label_3"));
        label_3->setGeometry(QRect(20, 90, 181, 31));
        textEdit = new QTextEdit(Payment);
        textEdit->setObjectName(QString::fromUtf8("textEdit"));
        textEdit->setGeometry(QRect(230, 10, 221, 31));
        textEdit_2 = new QTextEdit(Payment);
        textEdit_2->setObjectName(QString::fromUtf8("textEdit_2"));
        textEdit_2->setGeometry(QRect(230, 50, 221, 31));
        textEdit_3 = new QTextEdit(Payment);
        textEdit_3->setObjectName(QString::fromUtf8("textEdit_3"));
        textEdit_3->setGeometry(QRect(230, 90, 221, 31));

        retranslateUi(Payment);
        QObject::connect(buttonBox, SIGNAL(accepted()), Payment, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), Payment, SLOT(reject()));

        QMetaObject::connectSlotsByName(Payment);
    } // setupUi

    void retranslateUi(QDialog *Payment)
    {
        Payment->setWindowTitle(QApplication::translate("Payment", "Payment", nullptr));
        label->setText(QApplication::translate("Payment", "\320\275\320\276\320\274\320\265\321\200", nullptr));
        label_2->setText(QApplication::translate("Payment", "\320\264\320\260\321\202\320\260 \320\276\320\277\320\273\320\260\321\202\321\213", nullptr));
        label_3->setText(QApplication::translate("Payment", "\320\264\320\273\320\270\321\202\320\265\320\273\320\275\320\276\321\201\321\202\321\214 \320\260\320\261\320\276\320\275\320\270\320\274\320\265\320\275\321\202\320\260", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Payment: public Ui_Payment {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_PAYMENT_H
