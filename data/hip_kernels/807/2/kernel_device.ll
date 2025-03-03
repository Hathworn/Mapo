; ModuleID = '../data/hip_kernels/807/2/main.cu'
source_filename = "../data/hip_kernels/807/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6kerneliPbP12hiprandState(i32 %0, i8 addrspace(1)* nocapture %1, %struct.hiprandState addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = load i8, i8 addrspace(1)* %1, align 1, !tbaa !4, !range !8
  %6 = icmp ne i8 %5, 0
  %7 = icmp slt i32 %4, 10000
  %8 = select i1 %6, i1 %7, i1 false
  br i1 %8, label %9, label %79

9:                                                ; preds = %3
  %10 = add nsw i32 %0, -1
  %11 = sext i32 %10 to i64
  %12 = sext i32 %0 to i64
  %13 = icmp slt i32 %0, 2
  %14 = add nsw i32 %0, -2
  %15 = sitofp i32 %14 to float
  br label %16

16:                                               ; preds = %9, %73
  %17 = phi i32 [ %4, %9 ], [ %75, %73 ]
  %18 = srem i32 %17, 4096
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %19, i32 0, i32 0, i32 0
  %21 = load i32, i32 addrspace(1)* %20, align 8
  %22 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %19, i32 0, i32 0, i32 5, i64 0
  %23 = load i32, i32 addrspace(1)* %22, align 8
  %24 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %19, i32 0, i32 0, i32 5, i64 1
  %25 = load i32, i32 addrspace(1)* %24, align 4
  %26 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %19, i32 0, i32 0, i32 5, i64 2
  %27 = load i32, i32 addrspace(1)* %26, align 8
  %28 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %19, i32 0, i32 0, i32 5, i64 3
  %29 = load i32, i32 addrspace(1)* %28, align 4
  %30 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %19, i32 0, i32 0, i32 5, i64 4
  %31 = load i32, i32 addrspace(1)* %30, align 8
  %32 = lshr i32 %23, 2
  %33 = xor i32 %32, %23
  %34 = shl i32 %31, 4
  %35 = shl i32 %33, 1
  %36 = xor i32 %35, %34
  %37 = xor i32 %36, %33
  %38 = xor i32 %37, %31
  %39 = add i32 %21, 362437
  store i32 %39, i32 addrspace(1)* %20, align 8
  store i32 %25, i32 addrspace(1)* %22, align 8
  store i32 %27, i32 addrspace(1)* %24, align 4
  store i32 %29, i32 addrspace(1)* %26, align 8
  store i32 %31, i32 addrspace(1)* %28, align 4
  store i32 %38, i32 addrspace(1)* %30, align 8
  br i1 %13, label %65, label %40

40:                                               ; preds = %16
  %41 = add i32 %38, %39
  %42 = uitofp i32 %41 to float
  %43 = fmul contract float %42, 0x3DF0000000000000
  %44 = fadd contract float %43, 0x3DF0000000000000
  %45 = fmul contract float %44, %15
  %46 = fadd contract float %45, 1.000000e+00
  %47 = fptosi float %46 to i32
  %48 = sext i32 %47 to i64
  %49 = srem i64 %48, %12
  br label %50

50:                                               ; preds = %60, %40
  %51 = phi i64 [ %62, %60 ], [ %49, %40 ]
  %52 = phi i64 [ %61, %60 ], [ 1, %40 ]
  %53 = phi i64 [ %63, %60 ], [ 1, %40 ]
  %54 = srem i64 %51, %12
  %55 = and i64 %53, %11
  %56 = icmp eq i64 %55, 0
  br i1 %56, label %60, label %57

57:                                               ; preds = %50
  %58 = mul nsw i64 %54, %52
  %59 = srem i64 %58, %12
  br label %60

60:                                               ; preds = %57, %50
  %61 = phi i64 [ %59, %57 ], [ %52, %50 ]
  %62 = mul nsw i64 %54, %54
  %63 = shl i64 %53, 1
  %64 = icmp sgt i64 %63, %11
  br i1 %64, label %65, label %50, !llvm.loop !9

65:                                               ; preds = %60, %16
  %66 = phi i64 [ 1, %16 ], [ %61, %60 ]
  %67 = and i64 %66, 4294967295
  %68 = icmp eq i64 %67, 1
  br i1 %68, label %69, label %72

69:                                               ; preds = %65
  %70 = add nsw i32 %17, 4096
  %71 = load i8, i8 addrspace(1)* %1, align 1, !tbaa !4, !range !8
  br label %73

72:                                               ; preds = %65
  store i8 0, i8 addrspace(1)* %1, align 1, !tbaa !4
  br label %73

73:                                               ; preds = %72, %69
  %74 = phi i8 [ %71, %69 ], [ 0, %72 ]
  %75 = phi i32 [ %70, %69 ], [ %17, %72 ]
  %76 = icmp ne i8 %74, 0
  %77 = icmp slt i32 %75, 10000
  %78 = select i1 %76, i1 %77, i1 false
  br i1 %78, label %16, label %79, !llvm.loop !11

79:                                               ; preds = %73, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"bool", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i8 0, i8 2}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
