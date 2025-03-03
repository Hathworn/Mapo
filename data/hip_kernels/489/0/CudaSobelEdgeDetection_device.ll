; ModuleID = '../data/hip_kernels/489/0/main.cu'
source_filename = "../data/hip_kernels/489/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@Sobel_Gx = protected addrspace(1) externally_initialized global [3 x [3 x i32]] [[3 x i32] [i32 -1, i32 0, i32 1], [3 x i32] [i32 -2, i32 0, i32 2], [3 x i32] [i32 -1, i32 0, i32 1]], align 16
@Sobel_Gy = protected addrspace(1) externally_initialized global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 1], [3 x i32] zeroinitializer, [3 x i32] [i32 -1, i32 -2, i32 -1]], align 16
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast ([3 x [3 x i32]] addrspace(1)* @Sobel_Gx to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([3 x [3 x i32]] addrspace(1)* @Sobel_Gy to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22CudaSobelEdgeDetectionPhS_iii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = add nsw i32 %2, -1
  %7 = icmp sgt i32 %2, 1
  br i1 %7, label %8, label %27

8:                                                ; preds = %5
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add nsw i32 %3, -2
  %25 = mul nsw i32 %4, %4
  %26 = sitofp i32 %25 to double
  br label %28

27:                                               ; preds = %28, %5
  ret void

28:                                               ; preds = %8, %28
  %29 = phi i32 [ 0, %8 ], [ %130, %28 ]
  %30 = mul i32 %21, %29
  %31 = add i32 %30, %22
  %32 = mul i32 %31, %16
  %33 = add i32 %32, %23
  %34 = freeze i32 %33
  %35 = freeze i32 %24
  %36 = udiv i32 %34, %35
  %37 = add i32 %36, 1
  %38 = mul i32 %36, %35
  %39 = sub i32 %34, %38
  %40 = add nuw i32 %39, 1
  %41 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gx, i64 0, i64 0, i64 0), align 16, !tbaa !16
  %42 = mul nsw i32 %36, %3
  %43 = add nsw i32 %42, %39
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %44
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !20
  %47 = zext i8 %46 to i32
  %48 = mul nsw i32 %41, %47
  %49 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gx, i64 0, i64 0, i64 2), align 8, !tbaa !16
  %50 = add i32 %39, 2
  %51 = add nsw i32 %50, %42
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %52
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !20
  %55 = zext i8 %54 to i32
  %56 = mul nsw i32 %49, %55
  %57 = add nsw i32 %56, %48
  %58 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gx, i64 0, i64 1, i64 0), align 4, !tbaa !16
  %59 = mul nsw i32 %37, %3
  %60 = add nsw i32 %59, %39
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !20
  %64 = zext i8 %63 to i32
  %65 = mul nsw i32 %58, %64
  %66 = add nsw i32 %57, %65
  %67 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gx, i64 0, i64 1, i64 2), align 4, !tbaa !16
  %68 = add nsw i32 %59, %50
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !20
  %72 = zext i8 %71 to i32
  %73 = mul nsw i32 %67, %72
  %74 = add nsw i32 %66, %73
  %75 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gx, i64 0, i64 2, i64 0), align 8, !tbaa !16
  %76 = add i32 %36, 2
  %77 = mul nsw i32 %76, %3
  %78 = add nsw i32 %77, %39
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %79
  %81 = load i8, i8 addrspace(1)* %80, align 1, !tbaa !20
  %82 = zext i8 %81 to i32
  %83 = mul nsw i32 %75, %82
  %84 = add nsw i32 %74, %83
  %85 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gx, i64 0, i64 2, i64 2), align 16, !tbaa !16
  %86 = add nsw i32 %77, %50
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %87
  %89 = load i8, i8 addrspace(1)* %88, align 1, !tbaa !20
  %90 = zext i8 %89 to i32
  %91 = mul nsw i32 %85, %90
  %92 = add nsw i32 %84, %91
  %93 = sitofp i32 %92 to double
  %94 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gy, i64 0, i64 0, i64 0), align 16, !tbaa !16
  %95 = mul nsw i32 %94, %47
  %96 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gy, i64 0, i64 0, i64 1), align 4, !tbaa !16
  %97 = add nsw i32 %40, %42
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %98
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !20
  %101 = zext i8 %100 to i32
  %102 = mul nsw i32 %96, %101
  %103 = add nsw i32 %102, %95
  %104 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gy, i64 0, i64 0, i64 2), align 8, !tbaa !16
  %105 = mul nsw i32 %104, %55
  %106 = add nsw i32 %103, %105
  %107 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gy, i64 0, i64 2, i64 0), align 8, !tbaa !16
  %108 = mul nsw i32 %107, %82
  %109 = add nsw i32 %106, %108
  %110 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gy, i64 0, i64 2, i64 1), align 4, !tbaa !16
  %111 = add nsw i32 %77, %40
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %112
  %114 = load i8, i8 addrspace(1)* %113, align 1, !tbaa !20
  %115 = zext i8 %114 to i32
  %116 = mul nsw i32 %110, %115
  %117 = add nsw i32 %109, %116
  %118 = load i32, i32 addrspace(1)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(1)* @Sobel_Gy, i64 0, i64 2, i64 2), align 16, !tbaa !16
  %119 = mul nsw i32 %118, %90
  %120 = add nsw i32 %117, %119
  %121 = sitofp i32 %120 to double
  %122 = fmul contract double %93, %93
  %123 = fmul contract double %121, %121
  %124 = fadd contract double %122, %123
  %125 = fcmp contract ogt double %124, %26
  %126 = add nsw i32 %59, %40
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %127
  %129 = sext i1 %125 to i8
  store i8 %129, i8 addrspace(1)* %128, align 1, !tbaa !20
  %130 = add nuw nsw i32 %29, 1
  %131 = icmp slt i32 %37, %6
  br i1 %131, label %28, label %27, !llvm.loop !21
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!18, !18, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
