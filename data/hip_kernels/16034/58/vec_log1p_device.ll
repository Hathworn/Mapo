; ModuleID = '../data/hip_kernels/16034/58/main.cu'
source_filename = "../data/hip_kernels/16034/58/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_log1p(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %159

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = fadd double %35, 1.000000e+00
  %37 = fadd double %36, -1.000000e+00
  %38 = fsub double %37, %36
  %39 = fadd double %38, 1.000000e+00
  %40 = fsub double %35, %37
  %41 = fadd double %40, %39
  %42 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %43 = fcmp olt double %42, 0x3FE5555555555555
  %44 = sext i1 %43 to i32
  %45 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %46 = add i32 %45, %44
  %47 = sub nsw i32 0, %46
  %48 = tail call double @llvm.amdgcn.ldexp.f64(double %36, i32 %47)
  %49 = tail call double @llvm.amdgcn.ldexp.f64(double %41, i32 %47)
  %50 = fadd double %48, -1.000000e+00
  %51 = fadd double %50, 1.000000e+00
  %52 = fsub double %48, %51
  %53 = fadd double %49, %52
  %54 = fadd double %50, %53
  %55 = fsub double %54, %50
  %56 = fsub double %53, %55
  %57 = fadd double %48, 1.000000e+00
  %58 = fadd double %57, -1.000000e+00
  %59 = fsub double %48, %58
  %60 = fadd double %49, %59
  %61 = fadd double %57, %60
  %62 = fsub double %61, %57
  %63 = fsub double %60, %62
  %64 = tail call double @llvm.amdgcn.rcp.f64(double %61)
  %65 = fneg double %61
  %66 = tail call double @llvm.fma.f64(double %65, double %64, double 1.000000e+00)
  %67 = tail call double @llvm.fma.f64(double %66, double %64, double %64)
  %68 = tail call double @llvm.fma.f64(double %65, double %67, double 1.000000e+00)
  %69 = tail call double @llvm.fma.f64(double %68, double %67, double %67)
  %70 = fmul double %54, %69
  %71 = fmul double %61, %70
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %70, double %61, double %72)
  %74 = tail call double @llvm.fma.f64(double %70, double %63, double %73)
  %75 = fadd double %71, %74
  %76 = fsub double %75, %71
  %77 = fsub double %74, %76
  %78 = fsub double %54, %75
  %79 = fsub double %54, %78
  %80 = fsub double %79, %75
  %81 = fadd double %56, %80
  %82 = fsub double %81, %77
  %83 = fadd double %78, %82
  %84 = fsub double %83, %78
  %85 = fsub double %82, %84
  %86 = fmul double %69, %83
  %87 = fmul double %61, %86
  %88 = fneg double %87
  %89 = tail call double @llvm.fma.f64(double %86, double %61, double %88)
  %90 = tail call double @llvm.fma.f64(double %86, double %63, double %89)
  %91 = fadd double %87, %90
  %92 = fsub double %91, %87
  %93 = fsub double %90, %92
  %94 = fsub double %83, %91
  %95 = fsub double %83, %94
  %96 = fsub double %95, %91
  %97 = fadd double %85, %96
  %98 = fsub double %97, %93
  %99 = fadd double %94, %98
  %100 = fmul double %69, %99
  %101 = fadd double %70, %86
  %102 = fsub double %101, %70
  %103 = fsub double %86, %102
  %104 = fadd double %103, %100
  %105 = fadd double %101, %104
  %106 = fsub double %105, %101
  %107 = fsub double %104, %106
  %108 = fmul double %105, %105
  %109 = tail call double @llvm.fma.f64(double %108, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %110 = tail call double @llvm.fma.f64(double %108, double %109, double 0x3FC7474DD7F4DF2E)
  %111 = tail call double @llvm.fma.f64(double %108, double %110, double 0x3FCC71C016291751)
  %112 = tail call double @llvm.fma.f64(double %108, double %111, double 0x3FD249249B27ACF1)
  %113 = tail call double @llvm.fma.f64(double %108, double %112, double 0x3FD99999998EF7B6)
  %114 = tail call double @llvm.fma.f64(double %108, double %113, double 0x3FE5555555555780)
  %115 = sitofp i32 %46 to double
  %116 = fmul double %115, 0x3FE62E42FEFA39EF
  %117 = fneg double %116
  %118 = tail call double @llvm.fma.f64(double %115, double 0x3FE62E42FEFA39EF, double %117)
  %119 = tail call double @llvm.fma.f64(double %115, double 0x3C7ABC9E3B39803F, double %118)
  %120 = fadd double %116, %119
  %121 = fsub double %120, %116
  %122 = fsub double %119, %121
  %123 = tail call double @llvm.amdgcn.ldexp.f64(double %105, i32 1)
  %124 = tail call double @llvm.amdgcn.ldexp.f64(double %107, i32 1)
  %125 = fmul double %105, %108
  %126 = fmul double %125, %114
  %127 = fadd double %123, %126
  %128 = fsub double %127, %123
  %129 = fsub double %126, %128
  %130 = fadd double %124, %129
  %131 = fadd double %127, %130
  %132 = fsub double %131, %127
  %133 = fsub double %130, %132
  %134 = fadd double %120, %131
  %135 = fsub double %134, %120
  %136 = fsub double %134, %135
  %137 = fsub double %120, %136
  %138 = fsub double %131, %135
  %139 = fadd double %138, %137
  %140 = fadd double %122, %133
  %141 = fsub double %140, %122
  %142 = fsub double %140, %141
  %143 = fsub double %122, %142
  %144 = fsub double %133, %141
  %145 = fadd double %144, %143
  %146 = fadd double %140, %139
  %147 = fadd double %134, %146
  %148 = fsub double %147, %134
  %149 = fsub double %146, %148
  %150 = fadd double %145, %149
  %151 = fadd double %147, %150
  %152 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 512)
  %153 = select i1 %152, double %35, double %151
  %154 = fcmp olt double %35, -1.000000e+00
  %155 = select i1 %154, double 0x7FF8000000000000, double %153
  %156 = fcmp oeq double %35, -1.000000e+00
  %157 = select i1 %156, double 0xFFF0000000000000, double %155
  %158 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %157, double addrspace(1)* %158, align 8, !tbaa !16
  br label %159

159:                                              ; preds = %32, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
