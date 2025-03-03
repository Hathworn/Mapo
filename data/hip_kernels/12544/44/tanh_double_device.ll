; ModuleID = '../data/hip_kernels/12544/44/main.cu'
source_filename = "../data/hip_kernels/12544/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @tanh_double(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 %3, double addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %26

19:                                               ; preds = %5
  %20 = udiv i32 %14, %11
  %21 = mul i32 %20, %11
  %22 = icmp ugt i32 %14, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  br label %27

26:                                               ; preds = %188, %5
  ret void

27:                                               ; preds = %19, %188
  %28 = phi i32 [ %17, %19 ], [ %189, %188 ]
  %29 = icmp slt i32 %28, %1
  br i1 %29, label %188, label %30

30:                                               ; preds = %27
  %31 = srem i32 %28, %3
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %188

33:                                               ; preds = %30
  %34 = sext i32 %28 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !16
  %37 = tail call double @llvm.fabs.f64(double %36)
  %38 = fmul double %37, 0x3FF71547652B82FE
  %39 = tail call double @llvm.rint.f64(double %38)
  %40 = tail call double @llvm.fma.f64(double %39, double 0xBFE62E42FEFA3000, double %37)
  %41 = fadd double %40, 0.000000e+00
  %42 = fsub double %40, %41
  %43 = fadd double %42, 0.000000e+00
  %44 = fmul double %39, 0x3D53DE6AF278E000
  %45 = fsub double %41, %44
  %46 = fsub double %41, %45
  %47 = fsub double %46, %44
  %48 = fadd double %43, %47
  %49 = fadd double %45, %48
  %50 = fsub double %49, %45
  %51 = fsub double %48, %50
  %52 = fmul double %39, 0x3AC9CC01F97B57A0
  %53 = fsub double %49, %52
  %54 = fsub double %49, %53
  %55 = fsub double %54, %52
  %56 = fadd double %51, %55
  %57 = fadd double %53, %56
  %58 = fsub double %57, %53
  %59 = fsub double %56, %58
  %60 = tail call double @llvm.fma.f64(double %57, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %61 = tail call double @llvm.fma.f64(double %57, double %60, double 0x3EC71DEE623FDE64)
  %62 = tail call double @llvm.fma.f64(double %57, double %61, double 0x3EFA01997C89E6B0)
  %63 = tail call double @llvm.fma.f64(double %57, double %62, double 0x3F2A01A014761F6E)
  %64 = tail call double @llvm.fma.f64(double %57, double %63, double 0x3F56C16C1852B7B0)
  %65 = tail call double @llvm.fma.f64(double %57, double %64, double 0x3F81111111122322)
  %66 = tail call double @llvm.fma.f64(double %57, double %65, double 0x3FA55555555502A1)
  %67 = tail call double @llvm.fma.f64(double %57, double %66, double 0x3FC5555555555511)
  %68 = tail call double @llvm.fma.f64(double %57, double %67, double 0x3FE000000000000B)
  %69 = fmul double %57, %57
  %70 = fneg double %69
  %71 = tail call double @llvm.fma.f64(double %57, double %57, double %70)
  %72 = fmul double %59, 2.000000e+00
  %73 = tail call double @llvm.fma.f64(double %57, double %72, double %71)
  %74 = fadd double %69, %73
  %75 = fsub double %74, %69
  %76 = fsub double %73, %75
  %77 = fmul double %74, %68
  %78 = fneg double %77
  %79 = tail call double @llvm.fma.f64(double %74, double %68, double %78)
  %80 = tail call double @llvm.fma.f64(double %76, double %68, double %79)
  %81 = fadd double %77, %80
  %82 = fsub double %81, %77
  %83 = fsub double %80, %82
  %84 = fadd double %57, %81
  %85 = fsub double %84, %57
  %86 = fsub double %81, %85
  %87 = fadd double %59, %83
  %88 = fadd double %87, %86
  %89 = fadd double %84, %88
  %90 = fsub double %89, %84
  %91 = fsub double %88, %90
  %92 = fadd double %89, 1.000000e+00
  %93 = fadd double %92, -1.000000e+00
  %94 = fsub double %89, %93
  %95 = fadd double %91, %94
  %96 = fadd double %92, %95
  %97 = fsub double %96, %92
  %98 = fsub double %95, %97
  %99 = fptosi double %39 to i32
  %100 = tail call double @llvm.amdgcn.ldexp.f64(double %96, i32 %99)
  %101 = tail call double @llvm.amdgcn.ldexp.f64(double %98, i32 %99)
  %102 = tail call double @llvm.amdgcn.rcp.f64(double %100)
  %103 = fneg double %100
  %104 = tail call double @llvm.fma.f64(double %103, double %102, double 1.000000e+00)
  %105 = tail call double @llvm.fma.f64(double %104, double %102, double %102)
  %106 = tail call double @llvm.fma.f64(double %103, double %105, double 1.000000e+00)
  %107 = tail call double @llvm.fma.f64(double %106, double %105, double %105)
  %108 = fmul double %100, %107
  %109 = fneg double %108
  %110 = tail call double @llvm.fma.f64(double %107, double %100, double %109)
  %111 = tail call double @llvm.fma.f64(double %107, double %101, double %110)
  %112 = fadd double %108, %111
  %113 = fsub double %112, %108
  %114 = fsub double %111, %113
  %115 = fsub double 1.000000e+00, %112
  %116 = fsub double 1.000000e+00, %115
  %117 = fsub double %116, %112
  %118 = fsub double %117, %114
  %119 = fadd double %115, %118
  %120 = fsub double %119, %115
  %121 = fsub double %118, %120
  %122 = fmul double %107, %119
  %123 = fmul double %100, %122
  %124 = fneg double %123
  %125 = tail call double @llvm.fma.f64(double %122, double %100, double %124)
  %126 = tail call double @llvm.fma.f64(double %122, double %101, double %125)
  %127 = fadd double %123, %126
  %128 = fsub double %127, %123
  %129 = fsub double %126, %128
  %130 = fsub double %119, %127
  %131 = fsub double %119, %130
  %132 = fsub double %131, %127
  %133 = fadd double %121, %132
  %134 = fsub double %133, %129
  %135 = fadd double %130, %134
  %136 = fmul double %107, %135
  %137 = fadd double %107, %122
  %138 = fsub double %137, %107
  %139 = fsub double %122, %138
  %140 = fadd double %139, %136
  %141 = fadd double %137, %140
  %142 = fsub double %141, %137
  %143 = fsub double %140, %142
  %144 = fsub double %100, %141
  %145 = fsub double %100, %144
  %146 = fsub double %145, %141
  %147 = fadd double %101, %146
  %148 = fsub double %147, %143
  %149 = fadd double %144, %148
  %150 = fsub double %149, %144
  %151 = fsub double %148, %150
  %152 = fadd double %100, %141
  %153 = fsub double %152, %100
  %154 = fsub double %141, %153
  %155 = fadd double %101, %143
  %156 = fadd double %155, %154
  %157 = fadd double %152, %156
  %158 = fsub double %157, %152
  %159 = fsub double %156, %158
  %160 = tail call double @llvm.amdgcn.rcp.f64(double %157)
  %161 = fneg double %157
  %162 = tail call double @llvm.fma.f64(double %161, double %160, double 1.000000e+00)
  %163 = tail call double @llvm.fma.f64(double %162, double %160, double %160)
  %164 = tail call double @llvm.fma.f64(double %161, double %163, double 1.000000e+00)
  %165 = tail call double @llvm.fma.f64(double %164, double %163, double %163)
  %166 = fmul double %149, %165
  %167 = fmul double %157, %166
  %168 = fneg double %167
  %169 = tail call double @llvm.fma.f64(double %166, double %157, double %168)
  %170 = tail call double @llvm.fma.f64(double %166, double %159, double %169)
  %171 = fadd double %167, %170
  %172 = fsub double %171, %167
  %173 = fsub double %170, %172
  %174 = fsub double %149, %171
  %175 = fsub double %149, %174
  %176 = fsub double %175, %171
  %177 = fsub double %176, %173
  %178 = fadd double %151, %177
  %179 = fadd double %174, %178
  %180 = fmul double %165, %179
  %181 = fadd double %166, %180
  %182 = fcmp ogt double %37, 1.906250e+01
  %183 = select i1 %182, double 1.000000e+00, double %181
  %184 = fcmp olt double %37, 0x3E40000000000000
  %185 = select i1 %184, double %37, double %183
  %186 = tail call double @llvm.copysign.f64(double %185, double %36)
  %187 = getelementptr inbounds double, double addrspace(1)* %4, i64 %34
  store double %186, double addrspace(1)* %187, align 8, !tbaa !16
  br label %188

188:                                              ; preds = %27, %30, %33
  %189 = add i32 %25, %28
  %190 = icmp slt i32 %189, %0
  br i1 %190, label %27, label %26, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
