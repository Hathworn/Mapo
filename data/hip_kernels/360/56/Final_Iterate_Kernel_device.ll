; ModuleID = '../data/hip_kernels/360/56/main.cu'
source_filename = "../data/hip_kernels/360/56/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20Final_Iterate_KerneliPiS_S_S_S_S_S_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readnone %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readnone %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %0
  br i1 %19, label %20, label %70

20:                                               ; preds = %9
  %21 = sext i32 %18 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %21
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = icmp slt i32 %23, 1000001
  br i1 %26, label %27, label %58

27:                                               ; preds = %20
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %21
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = add nsw i32 %18, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = icmp slt i32 %29, %33
  br i1 %34, label %35, label %58

35:                                               ; preds = %27, %35
  %36 = phi i32 [ %55, %35 ], [ %23, %27 ]
  %37 = phi i32 [ %54, %35 ], [ %25, %27 ]
  %38 = phi i32 [ %56, %35 ], [ %29, %27 ]
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = icmp ne i32 %44, 0
  %48 = icmp eq i32 %44, %36
  %49 = select i1 %47, i1 %48, i1 false
  %50 = icmp sgt i32 %46, %37
  %51 = select i1 %49, i1 %50, i1 false
  %52 = icmp ugt i32 %44, %36
  %53 = select i1 %52, i1 true, i1 %51
  %54 = select i1 %53, i32 %46, i32 %37
  %55 = tail call i32 @llvm.umax.i32(i32 %44, i32 %36)
  %56 = add nsw i32 %38, 1
  %57 = icmp slt i32 %56, %33
  br i1 %57, label %35, label %58, !llvm.loop !11

58:                                               ; preds = %35, %27, %20
  %59 = phi i32 [ %25, %20 ], [ %25, %27 ], [ %54, %35 ]
  %60 = phi i32 [ %23, %20 ], [ %23, %27 ], [ %55, %35 ]
  %61 = icmp eq i32 %59, %18
  br i1 %61, label %66, label %62

62:                                               ; preds = %58
  %63 = icmp ne i32 %60, 1000001
  %64 = sext i1 %63 to i32
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %21
  store i32 %64, i32 addrspace(1)* %65, align 4, !tbaa !7
  br i1 %63, label %68, label %70

66:                                               ; preds = %58
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %21
  br label %68

68:                                               ; preds = %62, %66
  %69 = phi i32 addrspace(1)* [ %67, %66 ], [ %8, %62 ]
  store i32 1, i32 addrspace(1)* %69, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %68, %62, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #2

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
