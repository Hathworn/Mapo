; ModuleID = '../data/hip_kernels/14707/0/main.cu'
source_filename = "../data/hip_kernels/14707/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_sPrimes = protected addrspace(4) externally_initialized global [256 x i64] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([256 x i64] addrspace(4)* @d_sPrimes to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15kernel_trialDivPlPi(i64 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = shl nsw i32 %3, 7
  %6 = add nsw i32 %5, %4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %7
  %9 = load i64, i64 addrspace(1)* %8, align 8, !tbaa !5, !amdgpu.noclobber !9
  %10 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %7
  br label %11

11:                                               ; preds = %91, %2
  %12 = phi i32 [ 0, %2 ], [ %92, %91 ]
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds [256 x i64], [256 x i64] addrspace(4)* @d_sPrimes, i64 0, i64 %13
  %15 = load i64, i64 addrspace(4)* %14, align 16, !tbaa !5
  %16 = srem i64 %9, %15
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %11
  %19 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !10
  %20 = add nsw i32 %19, -1
  store i32 %20, i32 addrspace(1)* %10, align 4, !tbaa !10
  br label %21

21:                                               ; preds = %11, %18
  %22 = or i32 %12, 1
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds [256 x i64], [256 x i64] addrspace(4)* @d_sPrimes, i64 0, i64 %23
  %25 = load i64, i64 addrspace(4)* %24, align 8, !tbaa !5
  %26 = srem i64 %9, %25
  %27 = icmp eq i64 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %21
  %29 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !10
  %30 = add nsw i32 %29, -1
  store i32 %30, i32 addrspace(1)* %10, align 4, !tbaa !10
  br label %31

31:                                               ; preds = %28, %21
  %32 = or i32 %12, 2
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds [256 x i64], [256 x i64] addrspace(4)* @d_sPrimes, i64 0, i64 %33
  %35 = load i64, i64 addrspace(4)* %34, align 16, !tbaa !5
  %36 = srem i64 %9, %35
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %38, label %41

38:                                               ; preds = %31
  %39 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !10
  %40 = add nsw i32 %39, -1
  store i32 %40, i32 addrspace(1)* %10, align 4, !tbaa !10
  br label %41

41:                                               ; preds = %38, %31
  %42 = or i32 %12, 3
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds [256 x i64], [256 x i64] addrspace(4)* @d_sPrimes, i64 0, i64 %43
  %45 = load i64, i64 addrspace(4)* %44, align 8, !tbaa !5
  %46 = srem i64 %9, %45
  %47 = icmp eq i64 %46, 0
  br i1 %47, label %48, label %51

48:                                               ; preds = %41
  %49 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !10
  %50 = add nsw i32 %49, -1
  store i32 %50, i32 addrspace(1)* %10, align 4, !tbaa !10
  br label %51

51:                                               ; preds = %48, %41
  %52 = or i32 %12, 4
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds [256 x i64], [256 x i64] addrspace(4)* @d_sPrimes, i64 0, i64 %53
  %55 = load i64, i64 addrspace(4)* %54, align 16, !tbaa !5
  %56 = srem i64 %9, %55
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %58, label %61

58:                                               ; preds = %51
  %59 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !10
  %60 = add nsw i32 %59, -1
  store i32 %60, i32 addrspace(1)* %10, align 4, !tbaa !10
  br label %61

61:                                               ; preds = %58, %51
  %62 = or i32 %12, 5
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds [256 x i64], [256 x i64] addrspace(4)* @d_sPrimes, i64 0, i64 %63
  %65 = load i64, i64 addrspace(4)* %64, align 8, !tbaa !5
  %66 = srem i64 %9, %65
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %68, label %71

68:                                               ; preds = %61
  %69 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !10
  %70 = add nsw i32 %69, -1
  store i32 %70, i32 addrspace(1)* %10, align 4, !tbaa !10
  br label %71

71:                                               ; preds = %68, %61
  %72 = or i32 %12, 6
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds [256 x i64], [256 x i64] addrspace(4)* @d_sPrimes, i64 0, i64 %73
  %75 = load i64, i64 addrspace(4)* %74, align 16, !tbaa !5
  %76 = srem i64 %9, %75
  %77 = icmp eq i64 %76, 0
  br i1 %77, label %78, label %81

78:                                               ; preds = %71
  %79 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !10
  %80 = add nsw i32 %79, -1
  store i32 %80, i32 addrspace(1)* %10, align 4, !tbaa !10
  br label %81

81:                                               ; preds = %78, %71
  %82 = or i32 %12, 7
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds [256 x i64], [256 x i64] addrspace(4)* @d_sPrimes, i64 0, i64 %83
  %85 = load i64, i64 addrspace(4)* %84, align 8, !tbaa !5
  %86 = srem i64 %9, %85
  %87 = icmp eq i64 %86, 0
  br i1 %87, label %88, label %91

88:                                               ; preds = %81
  %89 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !10
  %90 = add nsw i32 %89, -1
  store i32 %90, i32 addrspace(1)* %10, align 4, !tbaa !10
  br label %91

91:                                               ; preds = %88, %81
  %92 = add nuw nsw i32 %12, 8
  %93 = icmp eq i32 %92, 256
  br i1 %93, label %94, label %11, !llvm.loop !12

94:                                               ; preds = %91
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
