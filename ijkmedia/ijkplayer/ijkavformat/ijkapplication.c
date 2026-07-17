#include <stddef.h>
#include <stdint.h>
#include "ijkapplication.h"
#include "libavutil/error.h"
#include "libavutil/mem.h"

int av_application_alloc(AVApplicationContext **ph, void *opaque)
{
    AVApplicationContext *h = av_mallocz(sizeof(*h));
    if (!h)
        return AVERROR(ENOMEM);
    h->opaque = opaque;
    *ph = h;
    return 0;
}

int av_application_open(AVApplicationContext **ph, void *opaque)
{
    return av_application_alloc(ph, opaque);
}

void av_application_close(AVApplicationContext *h)
{
    av_free(h);
}

void av_application_closep(AVApplicationContext **ph)
{
    if (ph && *ph) {
        av_application_close(*ph);
        *ph = NULL;
    }
}

int av_application_on_io_control(AVApplicationContext *h, int event_type, AVAppIOControl *control)
{
    if (h && h->func_on_app_event)
        return h->func_on_app_event(h, event_type, control, sizeof(*control));
    return 0;
}
