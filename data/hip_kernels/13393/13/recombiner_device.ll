; ModuleID = '../data/hip_kernels/13393/13/main.cu'
source_filename = "../data/hip_kernels/13393/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z10recombinerPdPjjjS0_jj(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = add i32 %8, %6
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds double, double addrspace(1)* %0, i64 %10
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !4, !amdgpu.noclobber !8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %15 = add i32 %13, %14
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !10, !invariant.load !8
  %20 = zext i16 %19 to i32
  %21 = mul i32 %15, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %23 = add i32 %21, %22
  %24 = add i32 %2, -1
  %25 = lshr i32 %24, 1
  %26 = uitofp i32 %25 to double
  %27 = fmul contract double %12, %26
  %28 = fptoui double %27 to i32
  %29 = shl i32 %3, 1
  %30 = mul i32 %29, %28
  %31 = add i32 %23, %30
  %32 = icmp ult i32 %23, %3
  br i1 %32, label %33, label %41

33:                                               ; preds = %7
  %34 = zext i32 %31 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !11, !amdgpu.noclobber !8
  %37 = add i32 %31, %3
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !11, !amdgpu.noclobber !8
  br label %41

41:                                               ; preds = %33, %7
  %42 = phi i32 [ %36, %33 ], [ 0, %7 ]
  %43 = phi i32 [ %40, %33 ], [ 0, %7 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = icmp ult i32 %23, %5
  br i1 %44, label %45, label %51

45:                                               ; preds = %41
  %46 = mul i32 %9, %5
  %47 = add i32 %23, %46
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !11, !amdgpu.noclobber !8
  br label %51

51:                                               ; preds = %45, %41
  %52 = phi i32 [ %50, %45 ], [ 0, %41 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %44, label %53, label %62

53:                                               ; preds = %51
  %54 = xor i32 %52, -1
  %55 = and i32 %42, %54
  %56 = and i32 %52, %43
  %57 = or i32 %55, %56
  %58 = mul i32 %9, %5
  %59 = add i32 %23, %58
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  store i32 %57, i32 addrspace(1)* %61, align 4, !tbaa !11
  br label %62

62:                                               ; preds = %53, %51
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !6, i64 0}
