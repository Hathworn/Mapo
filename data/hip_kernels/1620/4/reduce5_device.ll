; ModuleID = '../data/hip_kernels/1620/4/main.cu'
source_filename = "../data/hip_kernels/1620/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7reduce5PiS_iE5sdata = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7reduce5PiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 1
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = add i32 %13, %10
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = add nsw i32 %20, %16
  %22 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ7reduce5PiS_iE5sdata, i32 0, i32 %4
  store i32 %21, i32 addrspace(3)* %22, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = icmp ugt i16 %9, 65
  br i1 %23, label %26, label %24

24:                                               ; preds = %36, %3
  %25 = icmp ult i32 %4, 32
  br i1 %25, label %38, label %64

26:                                               ; preds = %3, %36
  %27 = phi i32 [ %28, %36 ], [ %10, %3 ]
  %28 = lshr i32 %27, 1
  %29 = icmp ult i32 %4, %28
  br i1 %29, label %30, label %36

30:                                               ; preds = %26
  %31 = add nuw nsw i32 %28, %4
  %32 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ7reduce5PiS_iE5sdata, i32 0, i32 %31
  %33 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !7
  %34 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !7
  %35 = add nsw i32 %34, %33
  store i32 %35, i32 addrspace(3)* %22, align 4, !tbaa !7
  br label %36

36:                                               ; preds = %30, %26
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp ugt i32 %27, 131
  br i1 %37, label %26, label %24, !llvm.loop !11

38:                                               ; preds = %24
  %39 = add nuw nsw i32 %4, 32
  %40 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ7reduce5PiS_iE5sdata, i32 0, i32 %39
  %41 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !7
  %42 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !7
  %43 = add nsw i32 %42, %41
  %44 = add nuw nsw i32 %4, 16
  %45 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ7reduce5PiS_iE5sdata, i32 0, i32 %44
  %46 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !7
  %47 = add nsw i32 %46, %43
  %48 = add nuw nsw i32 %4, 8
  %49 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ7reduce5PiS_iE5sdata, i32 0, i32 %48
  %50 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !7
  %51 = add nsw i32 %50, %47
  %52 = add nuw nsw i32 %4, 4
  %53 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ7reduce5PiS_iE5sdata, i32 0, i32 %52
  %54 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !7
  %55 = add nsw i32 %54, %51
  %56 = add nuw nsw i32 %4, 2
  %57 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ7reduce5PiS_iE5sdata, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !7
  %59 = add nsw i32 %58, %55
  %60 = add nuw nsw i32 %4, 1
  %61 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ7reduce5PiS_iE5sdata, i32 0, i32 %60
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !7
  %63 = add nsw i32 %62, %59
  store i32 %63, i32 addrspace(3)* %22, align 4, !tbaa !7
  br label %64

64:                                               ; preds = %38, %24
  %65 = icmp eq i32 %4, 0
  br i1 %65, label %66, label %70

66:                                               ; preds = %64
  %67 = load i32, i32 addrspace(3)* getelementptr inbounds ([256 x i32], [256 x i32] addrspace(3)* @_ZZ7reduce5PiS_iE5sdata, i32 0, i32 0), align 16, !tbaa !7
  %68 = zext i32 %5 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  store i32 %67, i32 addrspace(1)* %69, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %66, %64
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
