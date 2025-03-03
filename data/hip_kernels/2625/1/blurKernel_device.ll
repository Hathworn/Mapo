; ModuleID = '../data/hip_kernels/2625/1/main.cu'
source_filename = "../data/hip_kernels/2625/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10blurKernelPhS_jj(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  %22 = mul i32 %13, %2
  %23 = add i32 %22, %21
  %24 = mul i32 %3, %2
  %25 = icmp ult i32 %23, %24
  br i1 %25, label %26, label %98

26:                                               ; preds = %4
  %27 = icmp ult i32 %21, %2
  br i1 %27, label %28, label %78

28:                                               ; preds = %26
  %29 = icmp ult i32 %13, %3
  %30 = add nsw i32 %13, 9
  %31 = add nsw i32 %21, 9
  br label %32

32:                                               ; preds = %28, %69
  %33 = phi i32 [ %21, %28 ], [ %74, %69 ]
  %34 = phi i32 [ 0, %28 ], [ %73, %69 ]
  %35 = phi i32 [ 0, %28 ], [ %72, %69 ]
  %36 = phi i32 [ 0, %28 ], [ %71, %69 ]
  %37 = phi i32 [ 0, %28 ], [ %70, %69 ]
  br i1 %29, label %38, label %69

38:                                               ; preds = %32, %38
  %39 = phi i32 [ %65, %38 ], [ %13, %32 ]
  %40 = phi i32 [ %64, %38 ], [ %34, %32 ]
  %41 = phi i32 [ %63, %38 ], [ %35, %32 ]
  %42 = phi i32 [ %57, %38 ], [ %36, %32 ]
  %43 = phi i32 [ %51, %38 ], [ %37, %32 ]
  %44 = mul i32 %39, %2
  %45 = add i32 %44, %33
  %46 = mul i32 %45, 3
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !7, !amdgpu.noclobber !5
  %50 = zext i8 %49 to i32
  %51 = add nsw i32 %43, %50
  %52 = add i32 %46, 1
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !7, !amdgpu.noclobber !5
  %56 = zext i8 %55 to i32
  %57 = add nsw i32 %42, %56
  %58 = add i32 %46, 2
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7, !amdgpu.noclobber !5
  %62 = zext i8 %61 to i32
  %63 = add nsw i32 %41, %62
  %64 = add nsw i32 %40, 1
  %65 = add nuw nsw i32 %39, 1
  %66 = icmp ult i32 %65, %3
  %67 = icmp slt i32 %39, %30
  %68 = select i1 %66, i1 %67, i1 false
  br i1 %68, label %38, label %69, !llvm.loop !10

69:                                               ; preds = %38, %32
  %70 = phi i32 [ %37, %32 ], [ %51, %38 ]
  %71 = phi i32 [ %36, %32 ], [ %57, %38 ]
  %72 = phi i32 [ %35, %32 ], [ %63, %38 ]
  %73 = phi i32 [ %34, %32 ], [ %64, %38 ]
  %74 = add nuw nsw i32 %33, 1
  %75 = icmp ult i32 %74, %2
  %76 = icmp slt i32 %33, %31
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %32, label %78, !llvm.loop !12

78:                                               ; preds = %69, %26
  %79 = phi i32 [ 0, %26 ], [ %70, %69 ]
  %80 = phi i32 [ 0, %26 ], [ %71, %69 ]
  %81 = phi i32 [ 0, %26 ], [ %72, %69 ]
  %82 = phi i32 [ 0, %26 ], [ %73, %69 ]
  %83 = sdiv i32 %79, %82
  %84 = sdiv i32 %80, %82
  %85 = sdiv i32 %81, %82
  %86 = trunc i32 %83 to i8
  %87 = mul i32 %23, 3
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %88
  store i8 %86, i8 addrspace(1)* %89, align 1, !tbaa !7
  %90 = trunc i32 %84 to i8
  %91 = add i32 %87, 1
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %92
  store i8 %90, i8 addrspace(1)* %93, align 1, !tbaa !7
  %94 = trunc i32 %85 to i8
  %95 = add i32 %87, 2
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %96
  store i8 %94, i8 addrspace(1)* %97, align 1, !tbaa !7
  br label %98

98:                                               ; preds = %78, %4
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
