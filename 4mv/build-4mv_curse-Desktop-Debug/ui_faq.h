/********************************************************************************
** Form generated from reading UI file 'faq.ui'
**
** Created by: Qt User Interface Compiler version 5.12.8
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_FAQ_H
#define UI_FAQ_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextBrowser>

QT_BEGIN_NAMESPACE

class Ui_FAQ
{
public:
    QTextBrowser *textBrowser;
    QPushButton *pushButton;
    QPushButton *pushButton_2;
    QPushButton *pushButton_3;

    void setupUi(QDialog *FAQ)
    {
        if (FAQ->objectName().isEmpty())
            FAQ->setObjectName(QString::fromUtf8("FAQ"));
        FAQ->resize(512, 394);
        textBrowser = new QTextBrowser(FAQ);
        textBrowser->setObjectName(QString::fromUtf8("textBrowser"));
        textBrowser->setGeometry(QRect(10, 10, 491, 331));
        textBrowser->setStyleSheet(QString::fromUtf8("background-color: rgb(114, 159, 207);"));
        pushButton = new QPushButton(FAQ);
        pushButton->setObjectName(QString::fromUtf8("pushButton"));
        pushButton->setGeometry(QRect(20, 350, 89, 25));
        pushButton_2 = new QPushButton(FAQ);
        pushButton_2->setObjectName(QString::fromUtf8("pushButton_2"));
        pushButton_2->setGeometry(QRect(250, 350, 89, 25));
        pushButton_3 = new QPushButton(FAQ);
        pushButton_3->setObjectName(QString::fromUtf8("pushButton_3"));
        pushButton_3->setGeometry(QRect(380, 350, 89, 25));

        retranslateUi(FAQ);

        QMetaObject::connectSlotsByName(FAQ);
    } // setupUi

    void retranslateUi(QDialog *FAQ)
    {
        FAQ->setWindowTitle(QApplication::translate("FAQ", "FAQ", nullptr));
        pushButton->setText(QApplication::translate("FAQ", "\320\264\320\276\320\274\320\276\320\271", nullptr));
        pushButton_2->setText(QApplication::translate("FAQ", "<<", nullptr));
        pushButton_3->setText(QApplication::translate("FAQ", ">>", nullptr));
    } // retranslateUi

};

namespace Ui {
    class FAQ: public Ui_FAQ {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_FAQ_H
