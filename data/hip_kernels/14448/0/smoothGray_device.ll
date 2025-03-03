; ModuleID = '../data/hip_kernels/14448/0/main.cu'
source_filename = "../data/hip_kernels/14448/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10smoothGrayPhS_jj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = shl i32 %5, 16
  %13 = mul i32 %12, %10
  %14 = shl i32 %11, 10
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = or i32 %15, %16
  %18 = mul i32 %3, %2
  %19 = icmp ult i32 %17, %18
  br i1 %19, label %20, label %71

20:                                               ; preds = %4
  %21 = freeze i32 %17
  %22 = freeze i32 %2
  %23 = udiv i32 %21, %22
  %24 = add i32 %23, -2
  %25 = add i32 %23, 2
  %26 = mul i32 %23, %22
  %27 = sub i32 %21, %26
  %28 = add i32 %27, -2
  %29 = add i32 %27, 2
  %30 = tail call i32 @llvm.smax.i32(i32 %24, i32 0)
  %31 = tail call i32 @llvm.smax.i32(i32 %28, i32 0)
  %32 = icmp ult i32 %25, %2
  %33 = add i32 %2, -1
  %34 = select i1 %32, i32 %25, i32 %33
  %35 = icmp ult i32 %29, %2
  %36 = select i1 %35, i32 %29, i32 %33
  %37 = icmp sgt i32 %30, %34
  br i1 %37, label %49, label %38

38:                                               ; preds = %20
  %39 = icmp sgt i32 %31, %36
  br label %40

40:                                               ; preds = %38, %53
  %41 = phi i32 [ %30, %38 ], [ %56, %53 ]
  %42 = phi i32 [ 0, %38 ], [ %55, %53 ]
  %43 = phi i32 [ 0, %38 ], [ %54, %53 ]
  br i1 %39, label %53, label %44

44:                                               ; preds = %40
  %45 = mul i32 %41, %2
  br label %58

46:                                               ; preds = %53
  %47 = sdiv i32 %54, %55
  %48 = trunc i32 %47 to i8
  br label %49

49:                                               ; preds = %46, %20
  %50 = phi i8 [ %48, %46 ], [ poison, %20 ]
  %51 = zext i32 %17 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %51
  store i8 %50, i8 addrspace(1)* %52, align 1, !tbaa !7
  br label %71

53:                                               ; preds = %58, %40
  %54 = phi i32 [ %43, %40 ], [ %67, %58 ]
  %55 = phi i32 [ %42, %40 ], [ %68, %58 ]
  %56 = add nuw nsw i32 %41, 1
  %57 = icmp slt i32 %41, %34
  br i1 %57, label %40, label %46, !llvm.loop !10

58:                                               ; preds = %44, %58
  %59 = phi i32 [ %31, %44 ], [ %69, %58 ]
  %60 = phi i32 [ %42, %44 ], [ %68, %58 ]
  %61 = phi i32 [ %43, %44 ], [ %67, %58 ]
  %62 = add i32 %59, %45
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7, !amdgpu.noclobber !5
  %66 = zext i8 %65 to i32
  %67 = add nsw i32 %61, %66
  %68 = add nsw i32 %60, 1
  %69 = add nuw nsw i32 %59, 1
  %70 = icmp slt i32 %59, %36
  br i1 %70, label %58, label %53, !llvm.loop !12

71:                                               ; preds = %4, %49
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
