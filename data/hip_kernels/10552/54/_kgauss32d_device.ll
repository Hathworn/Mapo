; ModuleID = '../data/hip_kernels/10552/54/main.cu'
source_filename = "../data/hip_kernels/10552/54/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10_kgauss32diiiPfS_S_f(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5, float %6) local_unnamed_addr #0 {
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
  br i1 %21, label %22, label %203

22:                                               ; preds = %7
  %23 = icmp sgt i32 %2, 0
  %24 = fneg contract float %6
  %25 = fpext float %24 to double
  %26 = udiv i32 %17, %14
  %27 = mul i32 %26, %14
  %28 = icmp ugt i32 %17, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %14
  %32 = and i32 %2, 7
  %33 = icmp ult i32 %2, 8
  %34 = and i32 %2, -8
  %35 = icmp eq i32 %32, 0
  br label %36

36:                                               ; preds = %22, %173
  %37 = phi i32 [ %19, %22 ], [ %201, %173 ]
  br i1 %23, label %38, label %173

38:                                               ; preds = %36
  %39 = freeze i32 %37
  %40 = freeze i32 %0
  %41 = sdiv i32 %39, %40
  %42 = mul nsw i32 %41, %2
  %43 = mul i32 %41, %40
  %44 = sub i32 %39, %43
  %45 = mul nsw i32 %44, %2
  br i1 %33, label %149, label %46

46:                                               ; preds = %38, %46
  %47 = phi double [ %146, %46 ], [ 0.000000e+00, %38 ]
  %48 = phi i32 [ %139, %46 ], [ %42, %38 ]
  %49 = phi i32 [ %135, %46 ], [ %45, %38 ]
  %50 = phi i32 [ %147, %46 ], [ 0, %38 ]
  %51 = add nsw i32 %49, 1
  %52 = sext i32 %49 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = add nsw i32 %48, 1
  %56 = sext i32 %48 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = fsub contract float %54, %58
  %60 = fpext float %59 to double
  %61 = fmul contract double %60, %60
  %62 = fadd contract double %47, %61
  %63 = add nsw i32 %49, 2
  %64 = sext i32 %51 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %3, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = add nsw i32 %48, 2
  %68 = sext i32 %55 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %4, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16
  %71 = fsub contract float %66, %70
  %72 = fpext float %71 to double
  %73 = fmul contract double %72, %72
  %74 = fadd contract double %62, %73
  %75 = add nsw i32 %49, 3
  %76 = sext i32 %63 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %3, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = add nsw i32 %48, 3
  %80 = sext i32 %67 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %4, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = fsub contract float %78, %82
  %84 = fpext float %83 to double
  %85 = fmul contract double %84, %84
  %86 = fadd contract double %74, %85
  %87 = add nsw i32 %49, 4
  %88 = sext i32 %75 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %3, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = add nsw i32 %48, 4
  %92 = sext i32 %79 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %4, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %95 = fsub contract float %90, %94
  %96 = fpext float %95 to double
  %97 = fmul contract double %96, %96
  %98 = fadd contract double %86, %97
  %99 = add nsw i32 %49, 5
  %100 = sext i32 %87 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %3, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16
  %103 = add nsw i32 %48, 5
  %104 = sext i32 %91 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %4, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = fsub contract float %102, %106
  %108 = fpext float %107 to double
  %109 = fmul contract double %108, %108
  %110 = fadd contract double %98, %109
  %111 = add nsw i32 %49, 6
  %112 = sext i32 %99 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %3, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = add nsw i32 %48, 6
  %116 = sext i32 %103 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %4, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !16
  %119 = fsub contract float %114, %118
  %120 = fpext float %119 to double
  %121 = fmul contract double %120, %120
  %122 = fadd contract double %110, %121
  %123 = add nsw i32 %49, 7
  %124 = sext i32 %111 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %3, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %127 = add nsw i32 %48, 7
  %128 = sext i32 %115 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %4, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = fsub contract float %126, %130
  %132 = fpext float %131 to double
  %133 = fmul contract double %132, %132
  %134 = fadd contract double %122, %133
  %135 = add nsw i32 %49, 8
  %136 = sext i32 %123 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %3, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !16
  %139 = add nsw i32 %48, 8
  %140 = sext i32 %127 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %4, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !16
  %143 = fsub contract float %138, %142
  %144 = fpext float %143 to double
  %145 = fmul contract double %144, %144
  %146 = fadd contract double %134, %145
  %147 = add i32 %50, 8
  %148 = icmp eq i32 %147, %34
  br i1 %148, label %149, label %46, !llvm.loop !20

149:                                              ; preds = %46, %38
  %150 = phi double [ undef, %38 ], [ %146, %46 ]
  %151 = phi double [ 0.000000e+00, %38 ], [ %146, %46 ]
  %152 = phi i32 [ %42, %38 ], [ %139, %46 ]
  %153 = phi i32 [ %45, %38 ], [ %135, %46 ]
  br i1 %35, label %173, label %154

154:                                              ; preds = %149, %154
  %155 = phi double [ %170, %154 ], [ %151, %149 ]
  %156 = phi i32 [ %163, %154 ], [ %152, %149 ]
  %157 = phi i32 [ %159, %154 ], [ %153, %149 ]
  %158 = phi i32 [ %171, %154 ], [ 0, %149 ]
  %159 = add nsw i32 %157, 1
  %160 = sext i32 %157 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %3, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !16
  %163 = add nsw i32 %156, 1
  %164 = sext i32 %156 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %4, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !16
  %167 = fsub contract float %162, %166
  %168 = fpext float %167 to double
  %169 = fmul contract double %168, %168
  %170 = fadd contract double %155, %169
  %171 = add i32 %158, 1
  %172 = icmp eq i32 %171, %32
  br i1 %172, label %173, label %154, !llvm.loop !22

173:                                              ; preds = %149, %154, %36
  %174 = phi double [ 0.000000e+00, %36 ], [ %150, %149 ], [ %170, %154 ]
  %175 = fmul contract double %174, %25
  %176 = fmul double %175, 0x3FF71547652B82FE
  %177 = tail call double @llvm.rint.f64(double %176)
  %178 = fneg double %177
  %179 = tail call double @llvm.fma.f64(double %178, double 0x3FE62E42FEFA39EF, double %175)
  %180 = tail call double @llvm.fma.f64(double %178, double 0x3C7ABC9E3B39803F, double %179)
  %181 = tail call double @llvm.fma.f64(double %180, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %182 = tail call double @llvm.fma.f64(double %180, double %181, double 0x3EC71DEE623FDE64)
  %183 = tail call double @llvm.fma.f64(double %180, double %182, double 0x3EFA01997C89E6B0)
  %184 = tail call double @llvm.fma.f64(double %180, double %183, double 0x3F2A01A014761F6E)
  %185 = tail call double @llvm.fma.f64(double %180, double %184, double 0x3F56C16C1852B7B0)
  %186 = tail call double @llvm.fma.f64(double %180, double %185, double 0x3F81111111122322)
  %187 = tail call double @llvm.fma.f64(double %180, double %186, double 0x3FA55555555502A1)
  %188 = tail call double @llvm.fma.f64(double %180, double %187, double 0x3FC5555555555511)
  %189 = tail call double @llvm.fma.f64(double %180, double %188, double 0x3FE000000000000B)
  %190 = tail call double @llvm.fma.f64(double %180, double %189, double 1.000000e+00)
  %191 = tail call double @llvm.fma.f64(double %180, double %190, double 1.000000e+00)
  %192 = fptosi double %177 to i32
  %193 = tail call double @llvm.amdgcn.ldexp.f64(double %191, i32 %192)
  %194 = fcmp ogt double %175, 1.024000e+03
  %195 = select i1 %194, double 0x7FF0000000000000, double %193
  %196 = fcmp olt double %175, -1.075000e+03
  %197 = select i1 %196, double 0.000000e+00, double %195
  %198 = fptrunc double %197 to float
  %199 = sext i32 %37 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %5, i64 %199
  store float %198, float addrspace(1)* %200, align 4, !tbaa !16
  %201 = add i32 %31, %37
  %202 = icmp slt i32 %201, %20
  br i1 %202, label %36, label %203, !llvm.loop !24

203:                                              ; preds = %173, %7
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
