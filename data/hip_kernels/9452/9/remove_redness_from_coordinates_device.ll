; ModuleID = '../data/hip_kernels/9452/9/main.cu'
source_filename = "../data/hip_kernels/9452/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31remove_redness_from_coordinatesPKjPhS1_S1_S1_iiiii(i32 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readnone %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %5
  br i1 %20, label %21, label %71

21:                                               ; preds = %10
  %22 = mul nsw i32 %7, %6
  %23 = sub i32 %22, %19
  %24 = add nsw i32 %23, -1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = freeze i32 %27
  %29 = freeze i32 %7
  %30 = udiv i32 %28, %29
  %31 = mul i32 %30, %29
  %32 = sub i32 %28, %31
  %33 = and i32 %30, 65535
  %34 = and i32 %32, 65535
  %35 = sub nsw i32 %33, %8
  %36 = add i32 %33, %8
  %37 = icmp sgt i32 %35, %36
  br i1 %37, label %71, label %38

38:                                               ; preds = %21
  %39 = sub nsw i32 %34, %9
  %40 = add i32 %34, %9
  %41 = icmp sgt i32 %39, %40
  %42 = add nsw i32 %7, -1
  %43 = add nsw i32 %6, -1
  br label %44

44:                                               ; preds = %38, %50
  %45 = phi i32 [ %35, %38 ], [ %51, %50 ]
  br i1 %41, label %50, label %46

46:                                               ; preds = %44
  %47 = tail call i32 @llvm.smax.i32(i32 %45, i32 0)
  %48 = tail call i32 @llvm.smin.i32(i32 %43, i32 %47)
  %49 = mul nsw i32 %48, %7
  br label %53

50:                                               ; preds = %53, %44
  %51 = add i32 %45, 1
  %52 = icmp eq i32 %45, %36
  br i1 %52, label %71, label %44, !llvm.loop !11

53:                                               ; preds = %46, %53
  %54 = phi i32 [ %39, %46 ], [ %69, %53 ]
  %55 = tail call i32 @llvm.smax.i32(i32 %54, i32 0)
  %56 = tail call i32 @llvm.smin.i32(i32 %42, i32 %55)
  %57 = add nsw i32 %56, %49
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !13
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %58
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !13
  %63 = zext i8 %60 to i16
  %64 = zext i8 %62 to i16
  %65 = add nuw nsw i16 %64, %63
  %66 = lshr i16 %65, 1
  %67 = trunc i16 %66 to i8
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %58
  store i8 %67, i8 addrspace(1)* %68, align 1, !tbaa !13
  %69 = add i32 %54, 1
  %70 = icmp eq i32 %54, %40
  br i1 %70, label %50, label %53, !llvm.loop !14

71:                                               ; preds = %50, %21, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!9, !9, i64 0}
!14 = distinct !{!14, !12}
