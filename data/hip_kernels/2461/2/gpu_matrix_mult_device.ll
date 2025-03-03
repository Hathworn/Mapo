; ModuleID = '../data/hip_kernels/2461/2/main.cu'
source_filename = "../data/hip_kernels/2461/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15gpu_matrix_multPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  %25 = icmp sgt i32 %3, 0
  %26 = and i1 %24, %25
  br i1 %26, label %27, label %161

27:                                               ; preds = %4
  %28 = mul nsw i32 %13, %3
  %29 = add nsw i32 %28, %21
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = and i32 %3, 7
  %34 = icmp ult i32 %3, 8
  br i1 %34, label %139, label %35

35:                                               ; preds = %27
  %36 = and i32 %3, -8
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi float [ %32, %35 ], [ %135, %37 ]
  %39 = phi i32 [ 0, %35 ], [ %136, %37 ]
  %40 = phi i32 [ 0, %35 ], [ %137, %37 ]
  %41 = add nsw i32 %39, %28
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = mul nsw i32 %39, %3
  %46 = add nsw i32 %45, %21
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fmul contract float %44, %49
  %51 = fadd contract float %38, %50
  store float %51, float addrspace(1)* %31, align 4, !tbaa !7
  %52 = or i32 %39, 1
  %53 = add nsw i32 %52, %28
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = mul nsw i32 %52, %3
  %58 = add nsw i32 %57, %21
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fmul contract float %56, %61
  %63 = fadd contract float %51, %62
  store float %63, float addrspace(1)* %31, align 4, !tbaa !7
  %64 = or i32 %39, 2
  %65 = add nsw i32 %64, %28
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = mul nsw i32 %64, %3
  %70 = add nsw i32 %69, %21
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = fmul contract float %68, %73
  %75 = fadd contract float %63, %74
  store float %75, float addrspace(1)* %31, align 4, !tbaa !7
  %76 = or i32 %39, 3
  %77 = add nsw i32 %76, %28
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = mul nsw i32 %76, %3
  %82 = add nsw i32 %81, %21
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = fmul contract float %80, %85
  %87 = fadd contract float %75, %86
  store float %87, float addrspace(1)* %31, align 4, !tbaa !7
  %88 = or i32 %39, 4
  %89 = add nsw i32 %88, %28
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = mul nsw i32 %88, %3
  %94 = add nsw i32 %93, %21
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = fmul contract float %92, %97
  %99 = fadd contract float %87, %98
  store float %99, float addrspace(1)* %31, align 4, !tbaa !7
  %100 = or i32 %39, 5
  %101 = add nsw i32 %100, %28
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = mul nsw i32 %100, %3
  %106 = add nsw i32 %105, %21
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %99, %110
  store float %111, float addrspace(1)* %31, align 4, !tbaa !7
  %112 = or i32 %39, 6
  %113 = add nsw i32 %112, %28
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = mul nsw i32 %112, %3
  %118 = add nsw i32 %117, %21
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = fmul contract float %116, %121
  %123 = fadd contract float %111, %122
  store float %123, float addrspace(1)* %31, align 4, !tbaa !7
  %124 = or i32 %39, 7
  %125 = add nsw i32 %124, %28
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = mul nsw i32 %124, %3
  %130 = add nsw i32 %129, %21
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7
  %134 = fmul contract float %128, %133
  %135 = fadd contract float %123, %134
  store float %135, float addrspace(1)* %31, align 4, !tbaa !7
  %136 = add nuw nsw i32 %39, 8
  %137 = add i32 %40, 8
  %138 = icmp eq i32 %137, %36
  br i1 %138, label %139, label %37, !llvm.loop !11

139:                                              ; preds = %37, %27
  %140 = phi float [ %32, %27 ], [ %135, %37 ]
  %141 = phi i32 [ 0, %27 ], [ %136, %37 ]
  %142 = icmp eq i32 %33, 0
  br i1 %142, label %161, label %143

143:                                              ; preds = %139, %143
  %144 = phi float [ %157, %143 ], [ %140, %139 ]
  %145 = phi i32 [ %158, %143 ], [ %141, %139 ]
  %146 = phi i32 [ %159, %143 ], [ 0, %139 ]
  %147 = add nsw i32 %145, %28
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = mul nsw i32 %145, %3
  %152 = add nsw i32 %151, %21
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %156 = fmul contract float %150, %155
  %157 = fadd contract float %144, %156
  store float %157, float addrspace(1)* %31, align 4, !tbaa !7
  %158 = add nuw nsw i32 %145, 1
  %159 = add i32 %146, 1
  %160 = icmp eq i32 %159, %33
  br i1 %160, label %161, label %143, !llvm.loop !13

161:                                              ; preds = %139, %143, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
