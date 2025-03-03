; ModuleID = '../data/hip_kernels/492/1/main.cu'
source_filename = "../data/hip_kernels/492/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11one_stencilPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add nsw i32 %11, %4
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %43

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %4
  store i32 %17, i32 addrspace(3)* %18, align 4, !tbaa !7
  %19 = icmp ult i32 %4, 2
  br i1 %19, label %20, label %29

20:                                               ; preds = %14
  %21 = add i32 %12, %10
  %22 = icmp ult i32 %21, %2
  br i1 %22, label %23, label %29

23:                                               ; preds = %20
  %24 = zext i32 %21 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = add nuw nsw i32 %4, %10
  %28 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %27
  store i32 %26, i32 addrspace(3)* %28, align 4, !tbaa !7
  br label %29

29:                                               ; preds = %23, %20, %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = add nsw i32 %2, -2
  %31 = icmp slt i32 %12, %30
  br i1 %31, label %32, label %43

32:                                               ; preds = %29
  %33 = load i32, i32 addrspace(3)* %18, align 4, !tbaa !7
  %34 = add nuw nsw i32 %4, 1
  %35 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %34
  %36 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !7
  %37 = add nsw i32 %36, %33
  %38 = add nuw nsw i32 %4, 2
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %38
  %40 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !7
  %41 = add nsw i32 %37, %40
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  store i32 %41, i32 addrspace(1)* %42, align 4, !tbaa !7
  br label %43

43:                                               ; preds = %29, %32, %3
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

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
