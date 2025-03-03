; ModuleID = '../data/hip_kernels/7071/0/main.cu'
source_filename = "../data/hip_kernels/7071/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7mysgemmiiiPKfS0_PfE2As = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ7mysgemmiiiPKfS0_PfE2Bs = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7mysgemmiiiPKfS0_Pf(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %7
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %8
  %24 = add nsw i32 %2, -1
  %25 = sdiv i32 %24, 16
  %26 = add i32 %2, 30
  %27 = icmp ult i32 %26, 16
  br i1 %27, label %67, label %28

28:                                               ; preds = %6
  %29 = icmp ult i32 %16, %0
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 %8
  %31 = mul i32 %16, %2
  %32 = icmp ult i32 %23, %1
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 %7, i32 %8
  %34 = select i1 %29, i1 %32, i1 false
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 0
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 0, i32 %8
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 1
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 1, i32 %8
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 2
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 2, i32 %8
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 3
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 3, i32 %8
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 4
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 4, i32 %8
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 5
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 5, i32 %8
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 6
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 6, i32 %8
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 7
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 7, i32 %8
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 8
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 8, i32 %8
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 9
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 9, i32 %8
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 10
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 10, i32 %8
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 11
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 11, i32 %8
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 12
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 12, i32 %8
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 13
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 13, i32 %8
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 14
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 14, i32 %8
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2As, i32 0, i32 %7, i32 15
  %66 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ7mysgemmiiiPKfS0_PfE2Bs, i32 0, i32 15, i32 %8
  br label %72

67:                                               ; preds = %162, %6
  %68 = phi float [ 0.000000e+00, %6 ], [ %163, %162 ]
  %69 = icmp ult i32 %16, %0
  %70 = icmp ult i32 %23, %1
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %166, label %171

72:                                               ; preds = %28, %162
  %73 = phi i32 [ 0, %28 ], [ %164, %162 ]
  %74 = phi float [ 0.000000e+00, %28 ], [ %163, %162 ]
  %75 = shl i32 %73, 4
  br i1 %29, label %76, label %84

76:                                               ; preds = %72
  %77 = add i32 %75, %8
  %78 = icmp ult i32 %77, %2
  br i1 %78, label %79, label %84

79:                                               ; preds = %76
  %80 = add i32 %77, %31
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %3, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %84

84:                                               ; preds = %76, %72, %79
  %85 = phi float [ %83, %79 ], [ 0.000000e+00, %72 ], [ 0.000000e+00, %76 ]
  store float %85, float addrspace(3)* %30, align 4, !tbaa !7
  %86 = add i32 %75, %7
  %87 = icmp ult i32 %86, %2
  %88 = select i1 %87, i1 %32, i1 false
  br i1 %88, label %89, label %95

89:                                               ; preds = %84
  %90 = mul i32 %86, %1
  %91 = add i32 %90, %23
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %4, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %95

95:                                               ; preds = %84, %89
  %96 = phi float [ %94, %89 ], [ 0.000000e+00, %84 ]
  store float %96, float addrspace(3)* %33, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %97, label %162

97:                                               ; preds = %95
  %98 = load float, float addrspace(3)* %35, align 16, !tbaa !7
  %99 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %100 = fmul contract float %98, %99
  %101 = fadd contract float %74, %100
  %102 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %103 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %104 = fmul contract float %102, %103
  %105 = fadd contract float %101, %104
  %106 = load float, float addrspace(3)* %39, align 8, !tbaa !7
  %107 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %108 = fmul contract float %106, %107
  %109 = fadd contract float %105, %108
  %110 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %111 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %109, %112
  %114 = load float, float addrspace(3)* %43, align 16, !tbaa !7
  %115 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %113, %116
  %118 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %119 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %117, %120
  %122 = load float, float addrspace(3)* %47, align 8, !tbaa !7
  %123 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %121, %124
  %126 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %127 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %51, align 16, !tbaa !7
  %131 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %135 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  %138 = load float, float addrspace(3)* %55, align 8, !tbaa !7
  %139 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %137, %140
  %142 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %143 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %144 = fmul contract float %142, %143
  %145 = fadd contract float %141, %144
  %146 = load float, float addrspace(3)* %59, align 16, !tbaa !7
  %147 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %148 = fmul contract float %146, %147
  %149 = fadd contract float %145, %148
  %150 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %151 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %152 = fmul contract float %150, %151
  %153 = fadd contract float %149, %152
  %154 = load float, float addrspace(3)* %63, align 8, !tbaa !7
  %155 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %156 = fmul contract float %154, %155
  %157 = fadd contract float %153, %156
  %158 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %159 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %160 = fmul contract float %158, %159
  %161 = fadd contract float %157, %160
  br label %162

162:                                              ; preds = %97, %95
  %163 = phi float [ %74, %95 ], [ %161, %97 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %164 = add nuw i32 %73, 1
  %165 = icmp eq i32 %73, %25
  br i1 %165, label %67, label %72, !llvm.loop !11

166:                                              ; preds = %67
  %167 = mul i32 %16, %1
  %168 = add i32 %167, %23
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %5, i64 %169
  store float %68, float addrspace(1)* %170, align 4, !tbaa !7
  br label %171

171:                                              ; preds = %166, %67
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
