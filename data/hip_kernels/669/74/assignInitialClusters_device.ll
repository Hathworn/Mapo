; ModuleID = '../data/hip_kernels/669/74/main.cu'
source_filename = "../data/hip_kernels/669/74/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21assignInitialClustersiiiiPiiPfS_(i32 %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture writeonly %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = mul nsw i32 %25, %0
  %27 = add nsw i32 %26, %17
  %28 = icmp slt i32 %17, %0
  %29 = icmp slt i32 %25, %1
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %144

31:                                               ; preds = %8
  %32 = add nsw i32 %0, -1
  %33 = sdiv i32 %32, 8
  %34 = add nsw i32 %33, 1
  %35 = sdiv i32 %17, %34
  %36 = add nsw i32 %1, -1
  %37 = sdiv i32 %36, 8
  %38 = add nsw i32 %37, 1
  %39 = sdiv i32 %25, %38
  %40 = shl nsw i32 %39, 3
  %41 = add nsw i32 %40, %35
  %42 = sext i32 %27 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %42
  store i32 %41, i32 addrspace(1)* %43, align 4, !tbaa !7
  %44 = icmp sgt i32 %5, 0
  br i1 %44, label %45, label %144

45:                                               ; preds = %31
  %46 = and i32 %5, 7
  %47 = icmp ult i32 %5, 8
  br i1 %47, label %127, label %48

48:                                               ; preds = %45
  %49 = and i32 %5, -8
  br label %50

50:                                               ; preds = %50, %48
  %51 = phi i32 [ 0, %48 ], [ %124, %50 ]
  %52 = phi i32 [ 0, %48 ], [ %125, %50 ]
  %53 = mul nsw i32 %51, %2
  %54 = add nsw i32 %53, %27
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %6, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !11, !amdgpu.noclobber !5
  %58 = fmul contract float %57, 1.000000e+05
  %59 = fptosi float %58 to i32
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %55
  store i32 %59, i32 addrspace(1)* %60, align 4, !tbaa !7
  %61 = or i32 %51, 1
  %62 = mul nsw i32 %61, %2
  %63 = add nsw i32 %62, %27
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %6, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !11, !amdgpu.noclobber !5
  %67 = fmul contract float %66, 1.000000e+05
  %68 = fptosi float %67 to i32
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %64
  store i32 %68, i32 addrspace(1)* %69, align 4, !tbaa !7
  %70 = or i32 %51, 2
  %71 = mul nsw i32 %70, %2
  %72 = add nsw i32 %71, %27
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %6, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !11, !amdgpu.noclobber !5
  %76 = fmul contract float %75, 1.000000e+05
  %77 = fptosi float %76 to i32
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %73
  store i32 %77, i32 addrspace(1)* %78, align 4, !tbaa !7
  %79 = or i32 %51, 3
  %80 = mul nsw i32 %79, %2
  %81 = add nsw i32 %80, %27
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %6, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !11, !amdgpu.noclobber !5
  %85 = fmul contract float %84, 1.000000e+05
  %86 = fptosi float %85 to i32
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %82
  store i32 %86, i32 addrspace(1)* %87, align 4, !tbaa !7
  %88 = or i32 %51, 4
  %89 = mul nsw i32 %88, %2
  %90 = add nsw i32 %89, %27
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %6, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !11, !amdgpu.noclobber !5
  %94 = fmul contract float %93, 1.000000e+05
  %95 = fptosi float %94 to i32
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %91
  store i32 %95, i32 addrspace(1)* %96, align 4, !tbaa !7
  %97 = or i32 %51, 5
  %98 = mul nsw i32 %97, %2
  %99 = add nsw i32 %98, %27
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %6, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !11, !amdgpu.noclobber !5
  %103 = fmul contract float %102, 1.000000e+05
  %104 = fptosi float %103 to i32
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %100
  store i32 %104, i32 addrspace(1)* %105, align 4, !tbaa !7
  %106 = or i32 %51, 6
  %107 = mul nsw i32 %106, %2
  %108 = add nsw i32 %107, %27
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %6, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !11, !amdgpu.noclobber !5
  %112 = fmul contract float %111, 1.000000e+05
  %113 = fptosi float %112 to i32
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %109
  store i32 %113, i32 addrspace(1)* %114, align 4, !tbaa !7
  %115 = or i32 %51, 7
  %116 = mul nsw i32 %115, %2
  %117 = add nsw i32 %116, %27
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %6, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !11, !amdgpu.noclobber !5
  %121 = fmul contract float %120, 1.000000e+05
  %122 = fptosi float %121 to i32
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %118
  store i32 %122, i32 addrspace(1)* %123, align 4, !tbaa !7
  %124 = add nuw nsw i32 %51, 8
  %125 = add i32 %52, 8
  %126 = icmp eq i32 %125, %49
  br i1 %126, label %127, label %50, !llvm.loop !13

127:                                              ; preds = %50, %45
  %128 = phi i32 [ 0, %45 ], [ %124, %50 ]
  %129 = icmp eq i32 %46, 0
  br i1 %129, label %144, label %130

130:                                              ; preds = %127, %130
  %131 = phi i32 [ %141, %130 ], [ %128, %127 ]
  %132 = phi i32 [ %142, %130 ], [ 0, %127 ]
  %133 = mul nsw i32 %131, %2
  %134 = add nsw i32 %133, %27
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %6, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !11, !amdgpu.noclobber !5
  %138 = fmul contract float %137, 1.000000e+05
  %139 = fptosi float %138 to i32
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %135
  store i32 %139, i32 addrspace(1)* %140, align 4, !tbaa !7
  %141 = add nuw nsw i32 %131, 1
  %142 = add i32 %132, 1
  %143 = icmp eq i32 %142, %46
  br i1 %143, label %144, label %130, !llvm.loop !15

144:                                              ; preds = %127, %130, %31, %8
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
