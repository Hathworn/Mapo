; ModuleID = '../data/hip_kernels/16186/2/main.cu'
source_filename = "../data/hip_kernels/16186/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ3dotPiS_S_E4temp = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3dotPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %13
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = mul nsw i32 %17, %15
  %19 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %4
  store i32 %18, i32 addrspace(3)* %19, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp eq i32 %4, 0
  br i1 %20, label %23, label %91

21:                                               ; preds = %23
  %22 = atomicrmw add i32 addrspace(1)* %2, i32 %88 syncscope("agent-one-as") monotonic, align 4
  br label %91

23:                                               ; preds = %3, %23
  %24 = phi i32 [ %89, %23 ], [ 0, %3 ]
  %25 = phi i32 [ %88, %23 ], [ 0, %3 ]
  %26 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %24
  %27 = load i32, i32 addrspace(3)* %26, align 16, !tbaa !7
  %28 = add nsw i32 %27, %25
  %29 = or i32 %24, 1
  %30 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %29
  %31 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !7
  %32 = add nsw i32 %31, %28
  %33 = or i32 %24, 2
  %34 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %33
  %35 = load i32, i32 addrspace(3)* %34, align 8, !tbaa !7
  %36 = add nsw i32 %35, %32
  %37 = or i32 %24, 3
  %38 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %37
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !7
  %40 = add nsw i32 %39, %36
  %41 = or i32 %24, 4
  %42 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %41
  %43 = load i32, i32 addrspace(3)* %42, align 16, !tbaa !7
  %44 = add nsw i32 %43, %40
  %45 = or i32 %24, 5
  %46 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = add nsw i32 %47, %44
  %49 = or i32 %24, 6
  %50 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %49
  %51 = load i32, i32 addrspace(3)* %50, align 8, !tbaa !7
  %52 = add nsw i32 %51, %48
  %53 = or i32 %24, 7
  %54 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %53
  %55 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !7
  %56 = add nsw i32 %55, %52
  %57 = or i32 %24, 8
  %58 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %57
  %59 = load i32, i32 addrspace(3)* %58, align 16, !tbaa !7
  %60 = add nsw i32 %59, %56
  %61 = or i32 %24, 9
  %62 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %61
  %63 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !7
  %64 = add nsw i32 %63, %60
  %65 = or i32 %24, 10
  %66 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %65
  %67 = load i32, i32 addrspace(3)* %66, align 8, !tbaa !7
  %68 = add nsw i32 %67, %64
  %69 = or i32 %24, 11
  %70 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %69
  %71 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !7
  %72 = add nsw i32 %71, %68
  %73 = or i32 %24, 12
  %74 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %73
  %75 = load i32, i32 addrspace(3)* %74, align 16, !tbaa !7
  %76 = add nsw i32 %75, %72
  %77 = or i32 %24, 13
  %78 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %77
  %79 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !7
  %80 = add nsw i32 %79, %76
  %81 = or i32 %24, 14
  %82 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %81
  %83 = load i32, i32 addrspace(3)* %82, align 8, !tbaa !7
  %84 = add nsw i32 %83, %80
  %85 = or i32 %24, 15
  %86 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ3dotPiS_S_E4temp, i32 0, i32 %85
  %87 = load i32, i32 addrspace(3)* %86, align 4, !tbaa !7
  %88 = add nsw i32 %87, %84
  %89 = add nuw nsw i32 %24, 16
  %90 = icmp eq i32 %89, 512
  br i1 %90, label %21, label %23, !llvm.loop !11

91:                                               ; preds = %21, %3
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
