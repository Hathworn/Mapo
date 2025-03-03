; ModuleID = '../data/hip_kernels/16034/37/main.cu'
source_filename = "../data/hip_kernels/16034/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_atanh(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %186

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fadd double %36, 1.000000e+00
  %38 = fadd double %37, -1.000000e+00
  %39 = fsub double %36, %38
  %40 = fsub double 1.000000e+00, %36
  %41 = fsub double 1.000000e+00, %40
  %42 = fsub double %41, %36
  %43 = tail call double @llvm.amdgcn.rcp.f64(double %40)
  %44 = fneg double %40
  %45 = tail call double @llvm.fma.f64(double %44, double %43, double 1.000000e+00)
  %46 = tail call double @llvm.fma.f64(double %45, double %43, double %43)
  %47 = tail call double @llvm.fma.f64(double %44, double %46, double 1.000000e+00)
  %48 = tail call double @llvm.fma.f64(double %47, double %46, double %46)
  %49 = fmul double %37, %48
  %50 = fmul double %40, %49
  %51 = fneg double %50
  %52 = tail call double @llvm.fma.f64(double %49, double %40, double %51)
  %53 = tail call double @llvm.fma.f64(double %49, double %42, double %52)
  %54 = fadd double %50, %53
  %55 = fsub double %54, %50
  %56 = fsub double %53, %55
  %57 = fsub double %37, %54
  %58 = fsub double %37, %57
  %59 = fsub double %58, %54
  %60 = fsub double %59, %56
  %61 = fadd double %39, %60
  %62 = fadd double %57, %61
  %63 = fmul double %48, %62
  %64 = fadd double %49, %63
  %65 = fsub double %64, %49
  %66 = fsub double %63, %65
  %67 = tail call double @llvm.amdgcn.frexp.mant.f64(double %64)
  %68 = fcmp olt double %67, 0x3FE5555555555555
  %69 = sext i1 %68 to i32
  %70 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %64)
  %71 = add i32 %70, %69
  %72 = sub nsw i32 0, %71
  %73 = tail call double @llvm.amdgcn.ldexp.f64(double %64, i32 %72)
  %74 = tail call double @llvm.amdgcn.ldexp.f64(double %66, i32 %72)
  %75 = fadd double %73, -1.000000e+00
  %76 = fadd double %75, 1.000000e+00
  %77 = fsub double %73, %76
  %78 = fadd double %74, %77
  %79 = fadd double %75, %78
  %80 = fsub double %79, %75
  %81 = fsub double %78, %80
  %82 = fadd double %73, 1.000000e+00
  %83 = fadd double %82, -1.000000e+00
  %84 = fsub double %73, %83
  %85 = fadd double %74, %84
  %86 = fadd double %82, %85
  %87 = fsub double %86, %82
  %88 = fsub double %85, %87
  %89 = tail call double @llvm.amdgcn.rcp.f64(double %86)
  %90 = fneg double %86
  %91 = tail call double @llvm.fma.f64(double %90, double %89, double 1.000000e+00)
  %92 = tail call double @llvm.fma.f64(double %91, double %89, double %89)
  %93 = tail call double @llvm.fma.f64(double %90, double %92, double 1.000000e+00)
  %94 = tail call double @llvm.fma.f64(double %93, double %92, double %92)
  %95 = fmul double %79, %94
  %96 = fmul double %86, %95
  %97 = fneg double %96
  %98 = tail call double @llvm.fma.f64(double %95, double %86, double %97)
  %99 = tail call double @llvm.fma.f64(double %95, double %88, double %98)
  %100 = fadd double %96, %99
  %101 = fsub double %100, %96
  %102 = fsub double %99, %101
  %103 = fsub double %79, %100
  %104 = fsub double %79, %103
  %105 = fsub double %104, %100
  %106 = fadd double %81, %105
  %107 = fsub double %106, %102
  %108 = fadd double %103, %107
  %109 = fsub double %108, %103
  %110 = fsub double %107, %109
  %111 = fmul double %94, %108
  %112 = fmul double %86, %111
  %113 = fneg double %112
  %114 = tail call double @llvm.fma.f64(double %111, double %86, double %113)
  %115 = tail call double @llvm.fma.f64(double %111, double %88, double %114)
  %116 = fadd double %112, %115
  %117 = fsub double %116, %112
  %118 = fsub double %115, %117
  %119 = fsub double %108, %116
  %120 = fsub double %108, %119
  %121 = fsub double %120, %116
  %122 = fadd double %110, %121
  %123 = fsub double %122, %118
  %124 = fadd double %119, %123
  %125 = fmul double %94, %124
  %126 = fadd double %95, %111
  %127 = fsub double %126, %95
  %128 = fsub double %111, %127
  %129 = fadd double %128, %125
  %130 = fadd double %126, %129
  %131 = fsub double %130, %126
  %132 = fsub double %129, %131
  %133 = fmul double %130, %130
  %134 = tail call double @llvm.fma.f64(double %133, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %135 = tail call double @llvm.fma.f64(double %133, double %134, double 0x3FC7474DD7F4DF2E)
  %136 = tail call double @llvm.fma.f64(double %133, double %135, double 0x3FCC71C016291751)
  %137 = tail call double @llvm.fma.f64(double %133, double %136, double 0x3FD249249B27ACF1)
  %138 = tail call double @llvm.fma.f64(double %133, double %137, double 0x3FD99999998EF7B6)
  %139 = tail call double @llvm.fma.f64(double %133, double %138, double 0x3FE5555555555780)
  %140 = sitofp i32 %71 to double
  %141 = fmul double %140, 0x3FE62E42FEFA39EF
  %142 = fneg double %141
  %143 = tail call double @llvm.fma.f64(double %140, double 0x3FE62E42FEFA39EF, double %142)
  %144 = tail call double @llvm.fma.f64(double %140, double 0x3C7ABC9E3B39803F, double %143)
  %145 = fadd double %141, %144
  %146 = fsub double %145, %141
  %147 = fsub double %144, %146
  %148 = tail call double @llvm.amdgcn.ldexp.f64(double %130, i32 1)
  %149 = tail call double @llvm.amdgcn.ldexp.f64(double %132, i32 1)
  %150 = fmul double %130, %133
  %151 = fmul double %150, %139
  %152 = fadd double %148, %151
  %153 = fsub double %152, %148
  %154 = fsub double %151, %153
  %155 = fadd double %149, %154
  %156 = fadd double %152, %155
  %157 = fsub double %156, %152
  %158 = fsub double %155, %157
  %159 = fadd double %145, %156
  %160 = fsub double %159, %145
  %161 = fsub double %159, %160
  %162 = fsub double %145, %161
  %163 = fsub double %156, %160
  %164 = fadd double %163, %162
  %165 = fadd double %147, %158
  %166 = fsub double %165, %147
  %167 = fsub double %165, %166
  %168 = fsub double %147, %167
  %169 = fsub double %158, %166
  %170 = fadd double %169, %168
  %171 = fadd double %165, %164
  %172 = fadd double %159, %171
  %173 = fsub double %172, %159
  %174 = fsub double %171, %173
  %175 = fadd double %170, %174
  %176 = fadd double %172, %175
  %177 = fmul double %176, 5.000000e-01
  %178 = fcmp olt double %36, 0x3E40000000000000
  %179 = select i1 %178, double %36, double %177
  %180 = fcmp ogt double %36, 1.000000e+00
  %181 = select i1 %180, double 0x7FF8000000000000, double %179
  %182 = fcmp oeq double %36, 1.000000e+00
  %183 = select i1 %182, double 0x7FF0000000000000, double %181
  %184 = tail call double @llvm.copysign.f64(double %183, double %35)
  %185 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %184, double addrspace(1)* %185, align 8, !tbaa !16
  br label %186

186:                                              ; preds = %32, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
