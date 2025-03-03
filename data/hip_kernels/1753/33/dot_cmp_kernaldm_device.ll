; ModuleID = '../data/hip_kernels/1753/33/main.cu'
source_filename = "../data/hip_kernels/1753/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16dot_cmp_kernaldmPKfS0_S0_Pfiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %5
  %11 = add i32 %10, %8
  %12 = add i32 %11, %6
  %13 = freeze i32 %12
  %14 = icmp sgt i32 %4, 0
  br i1 %14, label %15, label %59

15:                                               ; preds = %7
  %16 = srem i32 %13, %4
  %17 = sub nsw i32 %13, %16
  %18 = and i32 %4, 3
  %19 = icmp ult i32 %4, 4
  br i1 %19, label %22, label %20

20:                                               ; preds = %15
  %21 = and i32 %4, -4
  br label %63

22:                                               ; preds = %140, %15
  %23 = phi float [ undef, %15 ], [ %141, %140 ]
  %24 = phi float [ undef, %15 ], [ %142, %140 ]
  %25 = phi float [ 0.000000e+00, %15 ], [ %142, %140 ]
  %26 = phi i32 [ 0, %15 ], [ %143, %140 ]
  %27 = phi float [ 0.000000e+00, %15 ], [ %141, %140 ]
  %28 = icmp eq i32 %18, 0
  br i1 %28, label %55, label %29

29:                                               ; preds = %22, %49
  %30 = phi float [ %51, %49 ], [ %25, %22 ]
  %31 = phi i32 [ %52, %49 ], [ %26, %22 ]
  %32 = phi float [ %50, %49 ], [ %27, %22 ]
  %33 = phi i32 [ %53, %49 ], [ 0, %22 ]
  %34 = add i32 %17, %31
  %35 = mul i32 %34, %4
  %36 = add i32 %35, %16
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = fcmp contract ogt float %39, 5.000000e-01
  br i1 %40, label %41, label %49

41:                                               ; preds = %29
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !5, !amdgpu.noclobber !9
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = fmul contract float %43, %45
  %47 = fadd contract float %30, %46
  %48 = fadd contract float %32, 1.000000e+00
  br label %49

49:                                               ; preds = %41, %29
  %50 = phi float [ %48, %41 ], [ %32, %29 ]
  %51 = phi float [ %47, %41 ], [ %30, %29 ]
  %52 = add nuw nsw i32 %31, 1
  %53 = add i32 %33, 1
  %54 = icmp eq i32 %53, %18
  br i1 %54, label %55, label %29, !llvm.loop !10

55:                                               ; preds = %49, %22
  %56 = phi float [ %23, %22 ], [ %50, %49 ]
  %57 = phi float [ %24, %22 ], [ %51, %49 ]
  %58 = fdiv contract float %57, %56
  br label %59

59:                                               ; preds = %55, %7
  %60 = phi float [ %58, %55 ], [ 0x7FF8000000000000, %7 ]
  %61 = sext i32 %13 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %3, i64 %61
  store float %60, float addrspace(1)* %62, align 4, !tbaa !5
  ret void

63:                                               ; preds = %140, %20
  %64 = phi float [ 0.000000e+00, %20 ], [ %142, %140 ]
  %65 = phi i32 [ 0, %20 ], [ %143, %140 ]
  %66 = phi float [ 0.000000e+00, %20 ], [ %141, %140 ]
  %67 = phi i32 [ 0, %20 ], [ %144, %140 ]
  %68 = add i32 %17, %65
  %69 = mul i32 %68, %4
  %70 = add i32 %69, %16
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = fcmp contract ogt float %73, 5.000000e-01
  br i1 %74, label %75, label %83

75:                                               ; preds = %63
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = fmul contract float %77, %79
  %81 = fadd contract float %64, %80
  %82 = fadd contract float %66, 1.000000e+00
  br label %83

83:                                               ; preds = %75, %63
  %84 = phi float [ %82, %75 ], [ %66, %63 ]
  %85 = phi float [ %81, %75 ], [ %64, %63 ]
  %86 = or i32 %65, 1
  %87 = add i32 %17, %86
  %88 = mul i32 %87, %4
  %89 = add i32 %88, %16
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = fcmp contract ogt float %92, 5.000000e-01
  br i1 %93, label %94, label %102

94:                                               ; preds = %83
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !5, !amdgpu.noclobber !9
  %99 = fmul contract float %96, %98
  %100 = fadd contract float %85, %99
  %101 = fadd contract float %84, 1.000000e+00
  br label %102

102:                                              ; preds = %94, %83
  %103 = phi float [ %101, %94 ], [ %84, %83 ]
  %104 = phi float [ %100, %94 ], [ %85, %83 ]
  %105 = or i32 %65, 2
  %106 = add i32 %17, %105
  %107 = mul i32 %106, %4
  %108 = add i32 %107, %16
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !5, !amdgpu.noclobber !9
  %112 = fcmp contract ogt float %111, 5.000000e-01
  br i1 %112, label %113, label %121

113:                                              ; preds = %102
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5, !amdgpu.noclobber !9
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = fmul contract float %115, %117
  %119 = fadd contract float %104, %118
  %120 = fadd contract float %103, 1.000000e+00
  br label %121

121:                                              ; preds = %113, %102
  %122 = phi float [ %120, %113 ], [ %103, %102 ]
  %123 = phi float [ %119, %113 ], [ %104, %102 ]
  %124 = or i32 %65, 3
  %125 = add i32 %17, %124
  %126 = mul i32 %125, %4
  %127 = add i32 %126, %16
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %2, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !5, !amdgpu.noclobber !9
  %131 = fcmp contract ogt float %130, 5.000000e-01
  br i1 %131, label %132, label %140

132:                                              ; preds = %121
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  %137 = fmul contract float %134, %136
  %138 = fadd contract float %123, %137
  %139 = fadd contract float %122, 1.000000e+00
  br label %140

140:                                              ; preds = %132, %121
  %141 = phi float [ %139, %132 ], [ %122, %121 ]
  %142 = phi float [ %138, %132 ], [ %123, %121 ]
  %143 = add nuw nsw i32 %65, 4
  %144 = add i32 %67, 4
  %145 = icmp eq i32 %144, %21
  br i1 %145, label %22, label %63, !llvm.loop !12
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
