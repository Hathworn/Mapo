; ModuleID = '../data/hip_kernels/7862/0/main.cu'
source_filename = "../data/hip_kernels/7862/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7dotProdPiS_S_E4temp = internal unnamed_addr addrspace(3) global [2048 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7dotProdPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %5
  %7 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !5, !amdgpu.noclobber !9
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %5
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = mul nsw i32 %9, %7
  %11 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %4
  store i32 %10, i32 addrspace(3)* %11, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %12 = icmp eq i32 %4, 0
  br i1 %12, label %14, label %82

13:                                               ; preds = %14
  store i32 %79, i32 addrspace(1)* %2, align 4, !tbaa !5
  br label %82

14:                                               ; preds = %3, %14
  %15 = phi i32 [ %80, %14 ], [ 0, %3 ]
  %16 = phi i32 [ %79, %14 ], [ 0, %3 ]
  %17 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %15
  %18 = load i32, i32 addrspace(3)* %17, align 16, !tbaa !5
  %19 = add nsw i32 %18, %16
  %20 = or i32 %15, 1
  %21 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %20
  %22 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !5
  %23 = add nsw i32 %22, %19
  %24 = or i32 %15, 2
  %25 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %24
  %26 = load i32, i32 addrspace(3)* %25, align 8, !tbaa !5
  %27 = add nsw i32 %26, %23
  %28 = or i32 %15, 3
  %29 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %28
  %30 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %31 = add nsw i32 %30, %27
  %32 = or i32 %15, 4
  %33 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %32
  %34 = load i32, i32 addrspace(3)* %33, align 16, !tbaa !5
  %35 = add nsw i32 %34, %31
  %36 = or i32 %15, 5
  %37 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %36
  %38 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %39 = add nsw i32 %38, %35
  %40 = or i32 %15, 6
  %41 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %40
  %42 = load i32, i32 addrspace(3)* %41, align 8, !tbaa !5
  %43 = add nsw i32 %42, %39
  %44 = or i32 %15, 7
  %45 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %44
  %46 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !5
  %47 = add nsw i32 %46, %43
  %48 = or i32 %15, 8
  %49 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %48
  %50 = load i32, i32 addrspace(3)* %49, align 16, !tbaa !5
  %51 = add nsw i32 %50, %47
  %52 = or i32 %15, 9
  %53 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %52
  %54 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !5
  %55 = add nsw i32 %54, %51
  %56 = or i32 %15, 10
  %57 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 8, !tbaa !5
  %59 = add nsw i32 %58, %55
  %60 = or i32 %15, 11
  %61 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %60
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %63 = add nsw i32 %62, %59
  %64 = or i32 %15, 12
  %65 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 16, !tbaa !5
  %67 = add nsw i32 %66, %63
  %68 = or i32 %15, 13
  %69 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %68
  %70 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !5
  %71 = add nsw i32 %70, %67
  %72 = or i32 %15, 14
  %73 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %72
  %74 = load i32, i32 addrspace(3)* %73, align 8, !tbaa !5
  %75 = add nsw i32 %74, %71
  %76 = or i32 %15, 15
  %77 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %76
  %78 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !5
  %79 = add nsw i32 %78, %75
  %80 = add nuw nsw i32 %15, 16
  %81 = icmp eq i32 %80, 2048
  br i1 %81, label %13, label %14, !llvm.loop !10

82:                                               ; preds = %13, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
