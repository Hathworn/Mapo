; ModuleID = '../data/hip_kernels/4489/134/main.cu'
source_filename = "../data/hip_kernels/4489/134/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19calibrate_fix2floatPfPKfS1_ffiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float %3, float %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = freeze i32 %6
  %12 = freeze i32 %7
  %13 = sdiv i32 %11, %12
  %14 = mul i32 %13, %12
  %15 = sub i32 %11, %14
  %16 = icmp ne i32 %15, 0
  %17 = zext i1 %16 to i32
  %18 = add nsw i32 %13, %17
  %19 = sext i32 %9 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = fcmp contract oeq float %21, 0.000000e+00
  %23 = select contract i1 %22, float 1.000000e+00, float %21
  %24 = mul nsw i32 %9, %6
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = icmp sgt i32 %18, 0
  br i1 %27, label %28, label %60

28:                                               ; preds = %8
  %29 = add i32 %13, %17
  %30 = add i32 %29, -1
  %31 = and i32 %18, 3
  %32 = icmp ult i32 %30, 3
  br i1 %32, label %35, label %33

33:                                               ; preds = %28
  %34 = and i32 %18, -4
  br label %61

35:                                               ; preds = %130, %28
  %36 = phi i32 [ 0, %28 ], [ %131, %130 ]
  %37 = icmp eq i32 %31, 0
  br i1 %37, label %60, label %38

38:                                               ; preds = %35, %56
  %39 = phi i32 [ %57, %56 ], [ %36, %35 ]
  %40 = phi i32 [ %58, %56 ], [ 0, %35 ]
  %41 = add nsw i32 %39, %10
  %42 = icmp slt i32 %41, %6
  br i1 %42, label %43, label %56

43:                                               ; preds = %38
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %26, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5
  %49 = fcmp contract oeq float %48, 0.000000e+00
  %50 = select contract i1 %49, float 2.550000e+02, float %48
  %51 = fmul contract float %46, %4
  %52 = fmul contract float %46, %3
  %53 = fmul contract float %23, %52
  %54 = fmul contract float %53, %50
  %55 = fadd contract float %51, %54
  store float %55, float addrspace(1)* %45, align 4, !tbaa !5
  br label %56

56:                                               ; preds = %43, %38
  %57 = add nsw i32 %39, %7
  %58 = add i32 %40, 1
  %59 = icmp eq i32 %58, %31
  br i1 %59, label %60, label %38, !llvm.loop !10

60:                                               ; preds = %35, %56, %8
  ret void

61:                                               ; preds = %130, %33
  %62 = phi i32 [ 0, %33 ], [ %131, %130 ]
  %63 = phi i32 [ 0, %33 ], [ %132, %130 ]
  %64 = add nsw i32 %62, %10
  %65 = icmp slt i32 %64, %6
  br i1 %65, label %66, label %79

66:                                               ; preds = %61
  %67 = sext i32 %64 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %26, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5
  %70 = getelementptr inbounds float, float addrspace(1)* %2, i64 %67
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5
  %72 = fcmp contract oeq float %71, 0.000000e+00
  %73 = select contract i1 %72, float 2.550000e+02, float %71
  %74 = fmul contract float %69, %4
  %75 = fmul contract float %69, %3
  %76 = fmul contract float %23, %75
  %77 = fmul contract float %76, %73
  %78 = fadd contract float %74, %77
  store float %78, float addrspace(1)* %68, align 4, !tbaa !5
  br label %79

79:                                               ; preds = %66, %61
  %80 = add nsw i32 %62, %7
  %81 = add nsw i32 %80, %10
  %82 = icmp slt i32 %81, %6
  br i1 %82, label %83, label %96

83:                                               ; preds = %79
  %84 = sext i32 %81 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %26, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  %89 = fcmp contract oeq float %88, 0.000000e+00
  %90 = select contract i1 %89, float 2.550000e+02, float %88
  %91 = fmul contract float %86, %4
  %92 = fmul contract float %86, %3
  %93 = fmul contract float %23, %92
  %94 = fmul contract float %93, %90
  %95 = fadd contract float %91, %94
  store float %95, float addrspace(1)* %85, align 4, !tbaa !5
  br label %96

96:                                               ; preds = %83, %79
  %97 = add nsw i32 %80, %7
  %98 = add nsw i32 %97, %10
  %99 = icmp slt i32 %98, %6
  br i1 %99, label %100, label %113

100:                                              ; preds = %96
  %101 = sext i32 %98 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %26, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5
  %106 = fcmp contract oeq float %105, 0.000000e+00
  %107 = select contract i1 %106, float 2.550000e+02, float %105
  %108 = fmul contract float %103, %4
  %109 = fmul contract float %103, %3
  %110 = fmul contract float %23, %109
  %111 = fmul contract float %110, %107
  %112 = fadd contract float %108, %111
  store float %112, float addrspace(1)* %102, align 4, !tbaa !5
  br label %113

113:                                              ; preds = %100, %96
  %114 = add nsw i32 %97, %7
  %115 = add nsw i32 %114, %10
  %116 = icmp slt i32 %115, %6
  br i1 %116, label %117, label %130

117:                                              ; preds = %113
  %118 = sext i32 %115 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %26, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !5
  %123 = fcmp contract oeq float %122, 0.000000e+00
  %124 = select contract i1 %123, float 2.550000e+02, float %122
  %125 = fmul contract float %120, %4
  %126 = fmul contract float %120, %3
  %127 = fmul contract float %23, %126
  %128 = fmul contract float %127, %124
  %129 = fadd contract float %125, %128
  store float %129, float addrspace(1)* %119, align 4, !tbaa !5
  br label %130

130:                                              ; preds = %117, %113
  %131 = add nsw i32 %114, %7
  %132 = add i32 %63, 4
  %133 = icmp eq i32 %132, %34
  br i1 %133, label %35, label %61, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
