; ModuleID = '../data/hip_kernels/9100/15/main.cu'
source_filename = "../data/hip_kernels/9100/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30_mean_variance_backward_kernelPfS_S_S_iiiS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !4
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  %26 = add i32 %25, %10
  %27 = mul i32 %26, %19
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %29, %5
  br i1 %30, label %31, label %194

31:                                               ; preds = %9
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %7, i64 %32
  store float 0.000000e+00, float addrspace(1)* %33, align 4, !tbaa !16
  %34 = getelementptr inbounds float, float addrspace(1)* %8, i64 %32
  store float 0.000000e+00, float addrspace(1)* %34, align 4, !tbaa !16
  %35 = icmp sgt i32 %4, 0
  br i1 %35, label %36, label %139

36:                                               ; preds = %31
  %37 = icmp sgt i32 %6, 0
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %39 = and i32 %6, 3
  %40 = icmp ult i32 %6, 4
  %41 = and i32 %6, -4
  %42 = icmp eq i32 %39, 0
  br label %43

43:                                               ; preds = %36, %136
  %44 = phi i32 [ 0, %36 ], [ %137, %136 ]
  br i1 %37, label %45, label %136

45:                                               ; preds = %43
  %46 = mul nsw i32 %44, %5
  %47 = add i32 %46, %29
  %48 = mul i32 %47, %6
  br i1 %40, label %114, label %49

49:                                               ; preds = %45, %49
  %50 = phi i32 [ %111, %49 ], [ 0, %45 ]
  %51 = phi i32 [ %112, %49 ], [ 0, %45 ]
  %52 = add nsw i32 %50, %48
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %57 = fadd contract float %55, %56
  store float %57, float addrspace(1)* %33, align 4, !tbaa !16
  %58 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %61 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %62 = fsub contract float %60, %61
  %63 = fmul contract float %58, %62
  %64 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %65 = fadd contract float %64, %63
  store float %65, float addrspace(1)* %34, align 4, !tbaa !16
  %66 = or i32 %50, 1
  %67 = add nsw i32 %66, %48
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16
  %71 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %72 = fadd contract float %70, %71
  store float %72, float addrspace(1)* %33, align 4, !tbaa !16
  %73 = load float, float addrspace(1)* %69, align 4, !tbaa !16
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %76 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %77 = fsub contract float %75, %76
  %78 = fmul contract float %73, %77
  %79 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %80 = fadd contract float %79, %78
  store float %80, float addrspace(1)* %34, align 4, !tbaa !16
  %81 = or i32 %50, 2
  %82 = add nsw i32 %81, %48
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %87 = fadd contract float %85, %86
  store float %87, float addrspace(1)* %33, align 4, !tbaa !16
  %88 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %92 = fsub contract float %90, %91
  %93 = fmul contract float %88, %92
  %94 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %95 = fadd contract float %94, %93
  store float %95, float addrspace(1)* %34, align 4, !tbaa !16
  %96 = or i32 %50, 3
  %97 = add nsw i32 %96, %48
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %102 = fadd contract float %100, %101
  store float %102, float addrspace(1)* %33, align 4, !tbaa !16
  %103 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16
  %106 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %107 = fsub contract float %105, %106
  %108 = fmul contract float %103, %107
  %109 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %110 = fadd contract float %109, %108
  store float %110, float addrspace(1)* %34, align 4, !tbaa !16
  %111 = add nuw nsw i32 %50, 4
  %112 = add i32 %51, 4
  %113 = icmp eq i32 %112, %41
  br i1 %113, label %114, label %49, !llvm.loop !20

114:                                              ; preds = %49, %45
  %115 = phi i32 [ 0, %45 ], [ %111, %49 ]
  br i1 %42, label %136, label %116

116:                                              ; preds = %114, %116
  %117 = phi i32 [ %133, %116 ], [ %115, %114 ]
  %118 = phi i32 [ %134, %116 ], [ 0, %114 ]
  %119 = add nsw i32 %117, %48
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %124 = fadd contract float %122, %123
  store float %124, float addrspace(1)* %33, align 4, !tbaa !16
  %125 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16
  %128 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %129 = fsub contract float %127, %128
  %130 = fmul contract float %125, %129
  %131 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %132 = fadd contract float %131, %130
  store float %132, float addrspace(1)* %34, align 4, !tbaa !16
  %133 = add nuw nsw i32 %117, 1
  %134 = add i32 %118, 1
  %135 = icmp eq i32 %134, %39
  br i1 %135, label %136, label %116, !llvm.loop !22

136:                                              ; preds = %114, %116, %43
  %137 = add nuw nsw i32 %44, 1
  %138 = icmp eq i32 %137, %4
  br i1 %138, label %139, label %43, !llvm.loop !24

139:                                              ; preds = %136, %31
  %140 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !16
  %142 = fadd contract float %141, 0x3EE4F8B580000000
  %143 = fcmp olt float %142, 0x39F0000000000000
  %144 = select i1 %143, float 0x41F0000000000000, float 1.000000e+00
  %145 = fmul float %142, %144
  %146 = tail call float @llvm.sqrt.f32(float %145)
  %147 = bitcast float %146 to i32
  %148 = add nsw i32 %147, -1
  %149 = bitcast i32 %148 to float
  %150 = add nsw i32 %147, 1
  %151 = bitcast i32 %150 to float
  %152 = tail call i1 @llvm.amdgcn.class.f32(float %145, i32 608)
  %153 = select i1 %143, float 0x3EF0000000000000, float 1.000000e+00
  %154 = fneg float %151
  %155 = tail call float @llvm.fma.f32(float %154, float %146, float %145)
  %156 = fcmp ogt float %155, 0.000000e+00
  %157 = fneg float %149
  %158 = tail call float @llvm.fma.f32(float %157, float %146, float %145)
  %159 = fcmp ole float %158, 0.000000e+00
  %160 = select i1 %159, float %149, float %146
  %161 = select i1 %156, float %151, float %160
  %162 = fmul float %153, %161
  %163 = select i1 %152, float %145, float %162
  %164 = fdiv contract float -1.000000e+00, %163
  %165 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %166 = fmul contract float %165, %164
  store float %166, float addrspace(1)* %33, align 4, !tbaa !16
  %167 = load float, float addrspace(1)* %140, align 4, !tbaa !16
  %168 = fcmp olt float %167, 0x39F0000000000000
  %169 = select i1 %168, float 0x41F0000000000000, float 1.000000e+00
  %170 = fmul float %167, %169
  %171 = tail call float @llvm.sqrt.f32(float %170)
  %172 = bitcast float %171 to i32
  %173 = add nsw i32 %172, -1
  %174 = bitcast i32 %173 to float
  %175 = add nsw i32 %172, 1
  %176 = bitcast i32 %175 to float
  %177 = tail call i1 @llvm.amdgcn.class.f32(float %170, i32 608)
  %178 = select i1 %168, float 0x3EF0000000000000, float 1.000000e+00
  %179 = fneg float %176
  %180 = tail call float @llvm.fma.f32(float %179, float %171, float %170)
  %181 = fcmp ogt float %180, 0.000000e+00
  %182 = fneg float %174
  %183 = tail call float @llvm.fma.f32(float %182, float %171, float %170)
  %184 = fcmp ole float %183, 0.000000e+00
  %185 = select i1 %184, float %174, float %171
  %186 = select i1 %181, float %176, float %185
  %187 = fmul float %178, %186
  %188 = select i1 %177, float %170, float %187
  %189 = fmul contract float %167, %188
  %190 = fadd contract float %189, 0x3EE4F8B580000000
  %191 = fdiv contract float -5.000000e-01, %190
  %192 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %193 = fmul contract float %192, %191
  store float %193, float addrspace(1)* %34, align 4, !tbaa !16
  br label %194

194:                                              ; preds = %9, %139
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
