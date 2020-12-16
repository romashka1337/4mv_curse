#include "faq.h"
#include "ui_faq.h"

FAQ::FAQ(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::FAQ)
{
    ui->setupUi(this);

    connect(ui->pushButton_3, SIGNAL(clicked()), ui->textBrowser, SLOT(forward()));
    connect(ui->pushButton_2, SIGNAL(clicked()), ui->textBrowser, SLOT(backward()));
    connect(ui->pushButton, SIGNAL(clicked()), ui->textBrowser, SLOT(home()));
    connect(ui->textBrowser, SIGNAL(forwardAvailable(bool)), ui->pushButton_3, SLOT(setEnabled(bool)));
    connect(ui->textBrowser, SIGNAL(backwardAvailable(bool)), ui->pushButton_2, SLOT(setEnabled(bool)));
    ui->textBrowser->setSource(QUrl::fromLocalFile("../4mv_curse/index.html"));
}

FAQ::~FAQ()
{
    delete ui;
}
