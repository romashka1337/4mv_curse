/********************************************************************************
** Form generated from reading UI file 'update.ui'
**
** Created by: Qt User Interface Compiler version 5.12.8
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_UPDATE_H
#define UI_UPDATE_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QLabel>
#include <QtWidgets/QTextEdit>

QT_BEGIN_NAMESPACE

class Ui_Update
{
public:
    QDialogButtonBox *buttonBox;
    QLabel *label_2;
    QLabel *label;
    QTextEdit *textEdit_2;
    QLabel *label_4;
    QTextEdit *textEdit;
    QLabel *label_3;
    QTextEdit *textEdit_4;
    QTextEdit *textEdit_3;
    QTextEdit *textEdit_7;
    QLabel *label_7;

    void setupUi(QDialog *Update)
    {
        if (Update->objectName().isEmpty())
            Update->setObjectName(QString::fromUtf8("Update"));
        Update->resize(372, 260);
        buttonBox = new QDialogButtonBox(Update);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(10, 220, 351, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        label_2 = new QLabel(Update);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setGeometry(QRect(10, 100, 67, 31));
        label = new QLabel(Update);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(10, 60, 67, 31));
        textEdit_2 = new QTextEdit(Update);
        textEdit_2->setObjectName(QString::fromUtf8("textEdit_2"));
        textEdit_2->setGeometry(QRect(160, 100, 201, 31));
        label_4 = new QLabel(Update);
        label_4->setObjectName(QString::fromUtf8("label_4"));
        label_4->setGeometry(QRect(10, 180, 131, 31));
        textEdit = new QTextEdit(Update);
        textEdit->setObjectName(QString::fromUtf8("textEdit"));
        textEdit->setGeometry(QRect(160, 60, 201, 31));
        label_3 = new QLabel(Update);
        label_3->setObjectName(QString::fromUtf8("label_3"));
        label_3->setGeometry(QRect(10, 140, 67, 31));
        textEdit_4 = new QTextEdit(Update);
        textEdit_4->setObjectName(QString::fromUtf8("textEdit_4"));
        textEdit_4->setGeometry(QRect(160, 180, 201, 31));
        textEdit_3 = new QTextEdit(Update);
        textEdit_3->setObjectName(QString::fromUtf8("textEdit_3"));
        textEdit_3->setGeometry(QRect(160, 140, 201, 31));
        textEdit_7 = new QTextEdit(Update);
        textEdit_7->setObjectName(QString::fromUtf8("textEdit_7"));
        textEdit_7->setGeometry(QRect(160, 20, 201, 31));
        label_7 = new QLabel(Update);
        label_7->setObjectName(QString::fromUtf8("label_7"));
        label_7->setGeometry(QRect(10, 20, 67, 31));

        retranslateUi(Update);
        QObject::connect(buttonBox, SIGNAL(accepted()), Update, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), Update, SLOT(reject()));

        QMetaObject::connectSlotsByName(Update);
    } // setupUi

    void retranslateUi(QDialog *Update)
    {
        Update->setWindowTitle(QApplication::translate("Update", "Edit", nullptr));
        label_2->setText(QApplication::translate("Update", "\320\277\320\276\320\273", nullptr));
        label->setText(QApplication::translate("Update", "\320\244\320\230\320\236", nullptr));
        label_4->setText(QApplication::translate("Update", "\320\264\320\260\321\202\320\260 \321\200\320\265\320\263\320\270\321\201\321\202\321\200\320\260\321\206\320\270\320\270", nullptr));
        label_3->setText(QApplication::translate("Update", "\321\202\320\265\320\273\320\265\321\204\320\276\320\275", nullptr));
        label_7->setText(QApplication::translate("Update", "\320\275\320\276\320\274\320\265\321\200", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Update: public Ui_Update {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_UPDATE_H
