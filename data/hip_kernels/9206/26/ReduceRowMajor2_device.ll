; ModuleID = '../data/hip_kernels/9206/26/main.cu'
source_filename = "../data/hip_kernels/9206/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15ReduceRowMajor2PiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %11
  store i32 0, i32 addrspace(3)* %13, align 4, !tbaa !7
  %14 = icmp ult i32 %12, %2
  br i1 %14, label %15, label %19

15:                                               ; preds = %3
  %16 = zext i32 %12 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %18, i32 addrspace(3)* %13, align 4, !tbaa !7
  br label %19

19:                                               ; preds = %15, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp ugt i16 %8, 4
  br i1 %20, label %23, label %21

21:                                               ; preds = %56, %19
  %22 = icmp eq i32 %11, 0
  br i1 %22, label %58, label %75

23:                                               ; preds = %19, %56
  %24 = phi i32 [ %25, %56 ], [ 4, %19 ]
  %25 = shl i32 %24, 1
  %26 = mul i32 %25, %11
  %27 = icmp ult i32 %26, %9
  br i1 %27, label %28, label %56

28:                                               ; preds = %23
  %29 = add i32 %26, %24
  %30 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %29
  %31 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !7
  %32 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %26
  %33 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !7
  %34 = add nsw i32 %33, %31
  store i32 %34, i32 addrspace(3)* %32, align 4, !tbaa !7
  %35 = or i32 %29, 1
  %36 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %35
  %37 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !7
  %38 = or i32 %26, 1
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %38
  %40 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !7
  %41 = add nsw i32 %40, %37
  store i32 %41, i32 addrspace(3)* %39, align 4, !tbaa !7
  %42 = or i32 %29, 2
  %43 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %42
  %44 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !7
  %45 = or i32 %26, 2
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = add nsw i32 %47, %44
  store i32 %48, i32 addrspace(3)* %46, align 4, !tbaa !7
  %49 = or i32 %29, 3
  %50 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %49
  %51 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %52 = or i32 %26, 3
  %53 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %52
  %54 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !7
  %55 = add nsw i32 %54, %51
  store i32 %55, i32 addrspace(3)* %53, align 4, !tbaa !7
  br label %56

56:                                               ; preds = %28, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = icmp ult i32 %25, %9
  br i1 %57, label %23, label %21, !llvm.loop !11

58:                                               ; preds = %21
  %59 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %60 = shl i32 %4, 2
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %61
  store i32 %59, i32 addrspace(1)* %62, align 4, !tbaa !7
  %63 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 1), align 4, !tbaa !7
  %64 = add nuw nsw i32 %60, 1
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  store i32 %63, i32 addrspace(1)* %66, align 4, !tbaa !7
  %67 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 2), align 4, !tbaa !7
  %68 = add nuw nsw i32 %60, 2
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  store i32 %67, i32 addrspace(1)* %70, align 4, !tbaa !7
  %71 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 3), align 4, !tbaa !7
  %72 = add nuw nsw i32 %60, 3
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  store i32 %71, i32 addrspace(1)* %74, align 4, !tbaa !7
  br label %75

75:                                               ; preds = %58, %21
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
