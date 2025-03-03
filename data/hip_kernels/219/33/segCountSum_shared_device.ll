; ModuleID = '../data/hip_kernels/219/33/main.cu'
source_filename = "../data/hip_kernels/219/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_counter = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18segCountSum_sharedPiS_i(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  %14 = icmp sgt i32 %2, 0
  %15 = and i1 %13, %14
  %16 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %12
  %17 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !7
  br i1 %15, label %18, label %105

18:                                               ; preds = %3
  %19 = and i32 %2, 7
  %20 = icmp ult i32 %2, 8
  br i1 %20, label %85, label %21

21:                                               ; preds = %18
  %22 = and i32 %2, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi i32 [ %17, %21 ], [ %81, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %82, %23 ]
  %26 = phi i32 [ 0, %21 ], [ %83, %23 ]
  %27 = mul nsw i32 %25, %2
  %28 = add i32 %27, %12
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = add nsw i32 %31, %24
  %33 = or i32 %25, 1
  %34 = mul nsw i32 %33, %2
  %35 = add i32 %34, %12
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %38, %32
  %40 = or i32 %25, 2
  %41 = mul nsw i32 %40, %2
  %42 = add i32 %41, %12
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = add nsw i32 %45, %39
  %47 = or i32 %25, 3
  %48 = mul nsw i32 %47, %2
  %49 = add i32 %48, %12
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = add nsw i32 %52, %46
  %54 = or i32 %25, 4
  %55 = mul nsw i32 %54, %2
  %56 = add i32 %55, %12
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = add nsw i32 %59, %53
  %61 = or i32 %25, 5
  %62 = mul nsw i32 %61, %2
  %63 = add i32 %62, %12
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = add nsw i32 %66, %60
  %68 = or i32 %25, 6
  %69 = mul nsw i32 %68, %2
  %70 = add i32 %69, %12
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = add nsw i32 %73, %67
  %75 = or i32 %25, 7
  %76 = mul nsw i32 %75, %2
  %77 = add i32 %76, %12
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = add nsw i32 %80, %74
  %82 = add nuw nsw i32 %25, 8
  %83 = add i32 %26, 8
  %84 = icmp eq i32 %83, %22
  br i1 %84, label %85, label %23, !llvm.loop !11

85:                                               ; preds = %23, %18
  %86 = phi i32 [ undef, %18 ], [ %81, %23 ]
  %87 = phi i32 [ %17, %18 ], [ %81, %23 ]
  %88 = phi i32 [ 0, %18 ], [ %82, %23 ]
  %89 = icmp eq i32 %19, 0
  br i1 %89, label %103, label %90

90:                                               ; preds = %85, %90
  %91 = phi i32 [ %99, %90 ], [ %87, %85 ]
  %92 = phi i32 [ %100, %90 ], [ %88, %85 ]
  %93 = phi i32 [ %101, %90 ], [ 0, %85 ]
  %94 = mul nsw i32 %92, %2
  %95 = add i32 %94, %12
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = add nsw i32 %98, %91
  %100 = add nuw nsw i32 %92, 1
  %101 = add i32 %93, 1
  %102 = icmp eq i32 %101, %19
  br i1 %102, label %103, label %90, !llvm.loop !13

103:                                              ; preds = %90, %85
  %104 = phi i32 [ %86, %85 ], [ %99, %90 ]
  store i32 %104, i32 addrspace(3)* %16, align 4, !tbaa !7
  br label %105

105:                                              ; preds = %3, %103
  %106 = phi i32 [ %104, %103 ], [ %17, %3 ]
  %107 = zext i32 %12 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %107
  store i32 %106, i32 addrspace(1)* %108, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
