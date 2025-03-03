; ModuleID = '../data/hip_kernels/669/47/main.cu'
source_filename = "../data/hip_kernels/669/47/main.cu"
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
  br i1 %30, label %31, label %145

31:                                               ; preds = %8
  %32 = add nsw i32 %0, -1
  %33 = sdiv i32 %32, 6
  %34 = add nsw i32 %33, 1
  %35 = sdiv i32 %17, %34
  %36 = add nsw i32 %1, -1
  %37 = sdiv i32 %36, 6
  %38 = add nsw i32 %37, 1
  %39 = sdiv i32 %25, %38
  %40 = mul nsw i32 %39, 6
  %41 = add nsw i32 %40, %35
  %42 = tail call i32 @llvm.smin.i32(i32 %41, i32 31)
  %43 = sext i32 %27 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %43
  store i32 %42, i32 addrspace(1)* %44, align 4, !tbaa !7
  %45 = icmp sgt i32 %5, 0
  br i1 %45, label %46, label %145

46:                                               ; preds = %31
  %47 = and i32 %5, 7
  %48 = icmp ult i32 %5, 8
  br i1 %48, label %128, label %49

49:                                               ; preds = %46
  %50 = and i32 %5, -8
  br label %51

51:                                               ; preds = %51, %49
  %52 = phi i32 [ 0, %49 ], [ %125, %51 ]
  %53 = phi i32 [ 0, %49 ], [ %126, %51 ]
  %54 = mul nsw i32 %52, %2
  %55 = add nsw i32 %54, %27
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %6, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !11, !amdgpu.noclobber !5
  %59 = fmul contract float %58, 1.000000e+05
  %60 = fptosi float %59 to i32
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %56
  store i32 %60, i32 addrspace(1)* %61, align 4, !tbaa !7
  %62 = or i32 %52, 1
  %63 = mul nsw i32 %62, %2
  %64 = add nsw i32 %63, %27
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %6, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !11, !amdgpu.noclobber !5
  %68 = fmul contract float %67, 1.000000e+05
  %69 = fptosi float %68 to i32
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %65
  store i32 %69, i32 addrspace(1)* %70, align 4, !tbaa !7
  %71 = or i32 %52, 2
  %72 = mul nsw i32 %71, %2
  %73 = add nsw i32 %72, %27
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %6, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !11, !amdgpu.noclobber !5
  %77 = fmul contract float %76, 1.000000e+05
  %78 = fptosi float %77 to i32
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %74
  store i32 %78, i32 addrspace(1)* %79, align 4, !tbaa !7
  %80 = or i32 %52, 3
  %81 = mul nsw i32 %80, %2
  %82 = add nsw i32 %81, %27
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %6, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11, !amdgpu.noclobber !5
  %86 = fmul contract float %85, 1.000000e+05
  %87 = fptosi float %86 to i32
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %83
  store i32 %87, i32 addrspace(1)* %88, align 4, !tbaa !7
  %89 = or i32 %52, 4
  %90 = mul nsw i32 %89, %2
  %91 = add nsw i32 %90, %27
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %6, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !11, !amdgpu.noclobber !5
  %95 = fmul contract float %94, 1.000000e+05
  %96 = fptosi float %95 to i32
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %92
  store i32 %96, i32 addrspace(1)* %97, align 4, !tbaa !7
  %98 = or i32 %52, 5
  %99 = mul nsw i32 %98, %2
  %100 = add nsw i32 %99, %27
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %6, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !11, !amdgpu.noclobber !5
  %104 = fmul contract float %103, 1.000000e+05
  %105 = fptosi float %104 to i32
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %101
  store i32 %105, i32 addrspace(1)* %106, align 4, !tbaa !7
  %107 = or i32 %52, 6
  %108 = mul nsw i32 %107, %2
  %109 = add nsw i32 %108, %27
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %6, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !11, !amdgpu.noclobber !5
  %113 = fmul contract float %112, 1.000000e+05
  %114 = fptosi float %113 to i32
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %110
  store i32 %114, i32 addrspace(1)* %115, align 4, !tbaa !7
  %116 = or i32 %52, 7
  %117 = mul nsw i32 %116, %2
  %118 = add nsw i32 %117, %27
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %6, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !11, !amdgpu.noclobber !5
  %122 = fmul contract float %121, 1.000000e+05
  %123 = fptosi float %122 to i32
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %119
  store i32 %123, i32 addrspace(1)* %124, align 4, !tbaa !7
  %125 = add nuw nsw i32 %52, 8
  %126 = add i32 %53, 8
  %127 = icmp eq i32 %126, %50
  br i1 %127, label %128, label %51, !llvm.loop !13

128:                                              ; preds = %51, %46
  %129 = phi i32 [ 0, %46 ], [ %125, %51 ]
  %130 = icmp eq i32 %47, 0
  br i1 %130, label %145, label %131

131:                                              ; preds = %128, %131
  %132 = phi i32 [ %142, %131 ], [ %129, %128 ]
  %133 = phi i32 [ %143, %131 ], [ 0, %128 ]
  %134 = mul nsw i32 %132, %2
  %135 = add nsw i32 %134, %27
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %6, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !11, !amdgpu.noclobber !5
  %139 = fmul contract float %138, 1.000000e+05
  %140 = fptosi float %139 to i32
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %136
  store i32 %140, i32 addrspace(1)* %141, align 4, !tbaa !7
  %142 = add nuw nsw i32 %132, 1
  %143 = add i32 %133, 1
  %144 = icmp eq i32 %143, %47
  br i1 %144, label %145, label %131, !llvm.loop !15

145:                                              ; preds = %128, %131, %31, %8
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
