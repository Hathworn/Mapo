; ModuleID = '../data/hip_kernels/3265/30/main.cu'
source_filename = "../data/hip_kernels/3265/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12matmulKernelPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = add i32 %21, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %25 = mul nuw nsw i32 %24, %15
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add nuw nsw i32 %25, %26
  %28 = icmp slt i32 %23, %3
  %29 = icmp slt i32 %27, %5
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %167

31:                                               ; preds = %6
  %32 = mul nsw i32 %23, %5
  %33 = add nsw i32 %32, %27
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  store float 0.000000e+00, float addrspace(1)* %35, align 4, !tbaa !16
  %36 = icmp sgt i32 %4, 0
  br i1 %36, label %37, label %167

37:                                               ; preds = %31
  %38 = mul nsw i32 %23, %4
  %39 = and i32 %4, 7
  %40 = icmp ult i32 %4, 8
  br i1 %40, label %145, label %41

41:                                               ; preds = %37
  %42 = and i32 %4, -8
  br label %43

43:                                               ; preds = %43, %41
  %44 = phi float [ 0.000000e+00, %41 ], [ %141, %43 ]
  %45 = phi i32 [ 0, %41 ], [ %142, %43 ]
  %46 = phi i32 [ 0, %41 ], [ %143, %43 ]
  %47 = add nsw i32 %45, %38
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = mul nsw i32 %45, %5
  %52 = add nsw i32 %51, %27
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = fmul contract float %50, %55
  %57 = fadd contract float %44, %56
  store float %57, float addrspace(1)* %35, align 4, !tbaa !16
  %58 = or i32 %45, 1
  %59 = add nsw i32 %58, %38
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16
  %63 = mul nsw i32 %58, %5
  %64 = add nsw i32 %63, %27
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = fmul contract float %62, %67
  %69 = fadd contract float %57, %68
  store float %69, float addrspace(1)* %35, align 4, !tbaa !16
  %70 = or i32 %45, 2
  %71 = add nsw i32 %70, %38
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  %75 = mul nsw i32 %70, %5
  %76 = add nsw i32 %75, %27
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fmul contract float %74, %79
  %81 = fadd contract float %69, %80
  store float %81, float addrspace(1)* %35, align 4, !tbaa !16
  %82 = or i32 %45, 3
  %83 = add nsw i32 %82, %38
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = mul nsw i32 %82, %5
  %88 = add nsw i32 %87, %27
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16
  %92 = fmul contract float %86, %91
  %93 = fadd contract float %81, %92
  store float %93, float addrspace(1)* %35, align 4, !tbaa !16
  %94 = or i32 %45, 4
  %95 = add nsw i32 %94, %38
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = mul nsw i32 %94, %5
  %100 = add nsw i32 %99, %27
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %104 = fmul contract float %98, %103
  %105 = fadd contract float %93, %104
  store float %105, float addrspace(1)* %35, align 4, !tbaa !16
  %106 = or i32 %45, 5
  %107 = add nsw i32 %106, %38
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = mul nsw i32 %106, %5
  %112 = add nsw i32 %111, %27
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16
  %116 = fmul contract float %110, %115
  %117 = fadd contract float %105, %116
  store float %117, float addrspace(1)* %35, align 4, !tbaa !16
  %118 = or i32 %45, 6
  %119 = add nsw i32 %118, %38
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = mul nsw i32 %118, %5
  %124 = add nsw i32 %123, %27
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16
  %128 = fmul contract float %122, %127
  %129 = fadd contract float %117, %128
  store float %129, float addrspace(1)* %35, align 4, !tbaa !16
  %130 = or i32 %45, 7
  %131 = add nsw i32 %130, %38
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  %135 = mul nsw i32 %130, %5
  %136 = add nsw i32 %135, %27
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = fmul contract float %134, %139
  %141 = fadd contract float %129, %140
  store float %141, float addrspace(1)* %35, align 4, !tbaa !16
  %142 = add nuw nsw i32 %45, 8
  %143 = add i32 %46, 8
  %144 = icmp eq i32 %143, %42
  br i1 %144, label %145, label %43, !llvm.loop !20

145:                                              ; preds = %43, %37
  %146 = phi float [ 0.000000e+00, %37 ], [ %141, %43 ]
  %147 = phi i32 [ 0, %37 ], [ %142, %43 ]
  %148 = icmp eq i32 %39, 0
  br i1 %148, label %167, label %149

149:                                              ; preds = %145, %149
  %150 = phi float [ %163, %149 ], [ %146, %145 ]
  %151 = phi i32 [ %164, %149 ], [ %147, %145 ]
  %152 = phi i32 [ %165, %149 ], [ 0, %145 ]
  %153 = add nsw i32 %151, %38
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !16
  %157 = mul nsw i32 %151, %5
  %158 = add nsw i32 %157, %27
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !16
  %162 = fmul contract float %156, %161
  %163 = fadd contract float %150, %162
  store float %163, float addrspace(1)* %35, align 4, !tbaa !16
  %164 = add nuw nsw i32 %151, 1
  %165 = add i32 %152, 1
  %166 = icmp eq i32 %165, %39
  br i1 %166, label %167, label %149, !llvm.loop !22

167:                                              ; preds = %145, %149, %31, %6
  ret void
}

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
