; ModuleID = '../data/hip_kernels/10552/55/main.cu'
source_filename = "../data/hip_kernels/10552/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10_kgauss64diiiPdS_S_d(i32 %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5, double %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = mul i32 %9, %14
  %19 = add i32 %18, %8
  %20 = mul nsw i32 %1, %0
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %192

22:                                               ; preds = %7
  %23 = icmp sgt i32 %2, 0
  %24 = fneg contract double %6
  %25 = udiv i32 %17, %14
  %26 = mul i32 %25, %14
  %27 = icmp ugt i32 %17, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %14
  %31 = and i32 %2, 7
  %32 = icmp ult i32 %2, 8
  %33 = and i32 %2, -8
  %34 = icmp eq i32 %31, 0
  br label %35

35:                                               ; preds = %22, %163
  %36 = phi i32 [ %19, %22 ], [ %190, %163 ]
  br i1 %23, label %37, label %163

37:                                               ; preds = %35
  %38 = freeze i32 %36
  %39 = freeze i32 %0
  %40 = sdiv i32 %38, %39
  %41 = mul nsw i32 %40, %2
  %42 = mul i32 %40, %39
  %43 = sub i32 %38, %42
  %44 = mul nsw i32 %43, %2
  br i1 %32, label %140, label %45

45:                                               ; preds = %37, %45
  %46 = phi double [ %137, %45 ], [ 0.000000e+00, %37 ]
  %47 = phi i32 [ %131, %45 ], [ %41, %37 ]
  %48 = phi i32 [ %127, %45 ], [ %44, %37 ]
  %49 = phi i32 [ %138, %45 ], [ 0, %37 ]
  %50 = add nsw i32 %48, 1
  %51 = sext i32 %48 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %3, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !16
  %54 = add nsw i32 %47, 1
  %55 = sext i32 %47 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %4, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !16
  %58 = fsub contract double %53, %57
  %59 = fmul contract double %58, %58
  %60 = fadd contract double %46, %59
  %61 = add nsw i32 %48, 2
  %62 = sext i32 %50 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %3, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !16
  %65 = add nsw i32 %47, 2
  %66 = sext i32 %54 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %4, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !16
  %69 = fsub contract double %64, %68
  %70 = fmul contract double %69, %69
  %71 = fadd contract double %60, %70
  %72 = add nsw i32 %48, 3
  %73 = sext i32 %61 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %3, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !16
  %76 = add nsw i32 %47, 3
  %77 = sext i32 %65 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %4, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !16
  %80 = fsub contract double %75, %79
  %81 = fmul contract double %80, %80
  %82 = fadd contract double %71, %81
  %83 = add nsw i32 %48, 4
  %84 = sext i32 %72 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %3, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !16
  %87 = add nsw i32 %47, 4
  %88 = sext i32 %76 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %4, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !16
  %91 = fsub contract double %86, %90
  %92 = fmul contract double %91, %91
  %93 = fadd contract double %82, %92
  %94 = add nsw i32 %48, 5
  %95 = sext i32 %83 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %3, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !16
  %98 = add nsw i32 %47, 5
  %99 = sext i32 %87 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %4, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !16
  %102 = fsub contract double %97, %101
  %103 = fmul contract double %102, %102
  %104 = fadd contract double %93, %103
  %105 = add nsw i32 %48, 6
  %106 = sext i32 %94 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %3, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !16
  %109 = add nsw i32 %47, 6
  %110 = sext i32 %98 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %4, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !16
  %113 = fsub contract double %108, %112
  %114 = fmul contract double %113, %113
  %115 = fadd contract double %104, %114
  %116 = add nsw i32 %48, 7
  %117 = sext i32 %105 to i64
  %118 = getelementptr inbounds double, double addrspace(1)* %3, i64 %117
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !16
  %120 = add nsw i32 %47, 7
  %121 = sext i32 %109 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %4, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !16
  %124 = fsub contract double %119, %123
  %125 = fmul contract double %124, %124
  %126 = fadd contract double %115, %125
  %127 = add nsw i32 %48, 8
  %128 = sext i32 %116 to i64
  %129 = getelementptr inbounds double, double addrspace(1)* %3, i64 %128
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !16
  %131 = add nsw i32 %47, 8
  %132 = sext i32 %120 to i64
  %133 = getelementptr inbounds double, double addrspace(1)* %4, i64 %132
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !16
  %135 = fsub contract double %130, %134
  %136 = fmul contract double %135, %135
  %137 = fadd contract double %126, %136
  %138 = add i32 %49, 8
  %139 = icmp eq i32 %138, %33
  br i1 %139, label %140, label %45, !llvm.loop !20

140:                                              ; preds = %45, %37
  %141 = phi double [ undef, %37 ], [ %137, %45 ]
  %142 = phi double [ 0.000000e+00, %37 ], [ %137, %45 ]
  %143 = phi i32 [ %41, %37 ], [ %131, %45 ]
  %144 = phi i32 [ %44, %37 ], [ %127, %45 ]
  br i1 %34, label %163, label %145

145:                                              ; preds = %140, %145
  %146 = phi double [ %160, %145 ], [ %142, %140 ]
  %147 = phi i32 [ %154, %145 ], [ %143, %140 ]
  %148 = phi i32 [ %150, %145 ], [ %144, %140 ]
  %149 = phi i32 [ %161, %145 ], [ 0, %140 ]
  %150 = add nsw i32 %148, 1
  %151 = sext i32 %148 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %3, i64 %151
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !16
  %154 = add nsw i32 %147, 1
  %155 = sext i32 %147 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %4, i64 %155
  %157 = load double, double addrspace(1)* %156, align 8, !tbaa !16
  %158 = fsub contract double %153, %157
  %159 = fmul contract double %158, %158
  %160 = fadd contract double %146, %159
  %161 = add i32 %149, 1
  %162 = icmp eq i32 %161, %31
  br i1 %162, label %163, label %145, !llvm.loop !22

163:                                              ; preds = %140, %145, %35
  %164 = phi double [ 0.000000e+00, %35 ], [ %141, %140 ], [ %160, %145 ]
  %165 = fmul contract double %164, %24
  %166 = fmul double %165, 0x3FF71547652B82FE
  %167 = tail call double @llvm.rint.f64(double %166)
  %168 = fneg double %167
  %169 = tail call double @llvm.fma.f64(double %168, double 0x3FE62E42FEFA39EF, double %165)
  %170 = tail call double @llvm.fma.f64(double %168, double 0x3C7ABC9E3B39803F, double %169)
  %171 = tail call double @llvm.fma.f64(double %170, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %172 = tail call double @llvm.fma.f64(double %170, double %171, double 0x3EC71DEE623FDE64)
  %173 = tail call double @llvm.fma.f64(double %170, double %172, double 0x3EFA01997C89E6B0)
  %174 = tail call double @llvm.fma.f64(double %170, double %173, double 0x3F2A01A014761F6E)
  %175 = tail call double @llvm.fma.f64(double %170, double %174, double 0x3F56C16C1852B7B0)
  %176 = tail call double @llvm.fma.f64(double %170, double %175, double 0x3F81111111122322)
  %177 = tail call double @llvm.fma.f64(double %170, double %176, double 0x3FA55555555502A1)
  %178 = tail call double @llvm.fma.f64(double %170, double %177, double 0x3FC5555555555511)
  %179 = tail call double @llvm.fma.f64(double %170, double %178, double 0x3FE000000000000B)
  %180 = tail call double @llvm.fma.f64(double %170, double %179, double 1.000000e+00)
  %181 = tail call double @llvm.fma.f64(double %170, double %180, double 1.000000e+00)
  %182 = fptosi double %167 to i32
  %183 = tail call double @llvm.amdgcn.ldexp.f64(double %181, i32 %182)
  %184 = fcmp ogt double %165, 1.024000e+03
  %185 = select i1 %184, double 0x7FF0000000000000, double %183
  %186 = fcmp olt double %165, -1.075000e+03
  %187 = select i1 %186, double 0.000000e+00, double %185
  %188 = sext i32 %36 to i64
  %189 = getelementptr inbounds double, double addrspace(1)* %5, i64 %188
  store double %187, double addrspace(1)* %189, align 8, !tbaa !16
  %190 = add i32 %30, %36
  %191 = icmp slt i32 %190, %20
  br i1 %191, label %35, label %192, !llvm.loop !24

192:                                              ; preds = %163, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
