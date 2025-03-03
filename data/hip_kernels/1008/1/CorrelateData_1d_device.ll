; ModuleID = '../data/hip_kernels/1008/1/main.cu'
source_filename = "../data/hip_kernels/1008/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@patch_data_char = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 1
@_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, float addrspace(1)* nocapture readonly %16, float addrspace(1)* nocapture readonly %17, float addrspace(1)* nocapture writeonly %18) local_unnamed_addr #0 {
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %20, %11
  %22 = add i32 %21, %6
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = mul i32 %23, %11
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %27 = icmp sgt i32 %10, 0
  br i1 %27, label %28, label %38

28:                                               ; preds = %19
  %29 = icmp slt i32 %26, %15
  %30 = mul nsw i32 %25, %14
  %31 = add nsw i32 %30, %24
  br label %32

32:                                               ; preds = %28, %51
  %33 = phi i32 [ 0, %28 ], [ %52, %51 ]
  %34 = mul nsw i32 %33, %10
  %35 = add nsw i32 %31, %33
  %36 = mul nsw i32 %35, %13
  %37 = add nsw i32 %36, %22
  br label %54

38:                                               ; preds = %51, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp sgt i32 %4, 0
  br i1 %39, label %40, label %74

40:                                               ; preds = %38
  %41 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 %26
  %42 = icmp slt i32 %26, %15
  %43 = mul nsw i32 %25, %14
  %44 = add nsw i32 %43, %24
  %45 = icmp eq i32 %26, 0
  %46 = mul nsw i32 %10, %10
  %47 = mul nsw i32 %46, %15
  %48 = sitofp i32 %47 to float
  %49 = mul nsw i32 %25, %5
  %50 = add i32 %49, %20
  br label %75

51:                                               ; preds = %61
  %52 = add nuw nsw i32 %33, 1
  %53 = icmp eq i32 %52, %10
  br i1 %53, label %38, label %32, !llvm.loop !5

54:                                               ; preds = %32, %61
  %55 = phi i32 [ 0, %32 ], [ %62, %61 ]
  %56 = add nsw i32 %55, %34
  %57 = mul nsw i32 %56, %15
  br i1 %29, label %58, label %61

58:                                               ; preds = %54
  %59 = add nsw i32 %37, %55
  %60 = mul nsw i32 %59, %15
  br label %64

61:                                               ; preds = %64, %54
  %62 = add nuw nsw i32 %55, 1
  %63 = icmp eq i32 %62, %10
  br i1 %63, label %51, label %54, !llvm.loop !7

64:                                               ; preds = %58, %64
  %65 = phi i32 [ %26, %58 ], [ %72, %64 ]
  %66 = add nsw i32 %65, %60
  %67 = add nsw i32 %65, %57
  %68 = sext i32 %66 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %16, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !8, !amdgpu.noclobber !12
  %71 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @patch_data_char to float addrspace(3)*), i32 %67
  store float %70, float addrspace(3)* %71, align 4, !tbaa !8
  %72 = add nuw nsw i32 %65, 32
  %73 = icmp slt i32 %72, %15
  br i1 %73, label %64, label %61, !llvm.loop !13

74:                                               ; preds = %192, %38
  ret void

75:                                               ; preds = %40, %192
  %76 = phi i32 [ 0, %40 ], [ %193, %192 ]
  store float 0.000000e+00, float addrspace(3)* %41, align 4, !tbaa !8
  br i1 %27, label %77, label %89

77:                                               ; preds = %75
  %78 = srem i32 %76, %8
  %79 = add nsw i32 %78, %7
  %80 = mul nsw i32 %79, %12
  %81 = add nsw i32 %80, %22
  br label %82

82:                                               ; preds = %77, %162
  %83 = phi float [ 0.000000e+00, %77 ], [ %175, %162 ]
  %84 = phi i32 [ 0, %77 ], [ %163, %162 ]
  %85 = mul nsw i32 %84, %10
  %86 = add nsw i32 %44, %84
  %87 = mul nsw i32 %86, %13
  %88 = add nsw i32 %81, %87
  br label %165

89:                                               ; preds = %162, %75
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %45, label %90, label %192

90:                                               ; preds = %89
  %91 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 0), align 16, !tbaa !8
  %92 = fadd contract float %91, 0.000000e+00
  %93 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 1), align 4, !tbaa !8
  %94 = fadd contract float %92, %93
  %95 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 2), align 8, !tbaa !8
  %96 = fadd contract float %94, %95
  %97 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 3), align 4, !tbaa !8
  %98 = fadd contract float %96, %97
  %99 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 4), align 16, !tbaa !8
  %100 = fadd contract float %98, %99
  %101 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 5), align 4, !tbaa !8
  %102 = fadd contract float %100, %101
  %103 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 6), align 8, !tbaa !8
  %104 = fadd contract float %102, %103
  %105 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 7), align 4, !tbaa !8
  %106 = fadd contract float %104, %105
  %107 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 8), align 16, !tbaa !8
  %108 = fadd contract float %106, %107
  %109 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 9), align 4, !tbaa !8
  %110 = fadd contract float %108, %109
  %111 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 10), align 8, !tbaa !8
  %112 = fadd contract float %110, %111
  %113 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 11), align 4, !tbaa !8
  %114 = fadd contract float %112, %113
  %115 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 12), align 16, !tbaa !8
  %116 = fadd contract float %114, %115
  %117 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 13), align 4, !tbaa !8
  %118 = fadd contract float %116, %117
  %119 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 14), align 8, !tbaa !8
  %120 = fadd contract float %118, %119
  %121 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 15), align 4, !tbaa !8
  %122 = fadd contract float %120, %121
  %123 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 16), align 16, !tbaa !8
  %124 = fadd contract float %122, %123
  %125 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 17), align 4, !tbaa !8
  %126 = fadd contract float %124, %125
  %127 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 18), align 8, !tbaa !8
  %128 = fadd contract float %126, %127
  %129 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 19), align 4, !tbaa !8
  %130 = fadd contract float %128, %129
  %131 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 20), align 16, !tbaa !8
  %132 = fadd contract float %130, %131
  %133 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 21), align 4, !tbaa !8
  %134 = fadd contract float %132, %133
  %135 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 22), align 8, !tbaa !8
  %136 = fadd contract float %134, %135
  %137 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 23), align 4, !tbaa !8
  %138 = fadd contract float %136, %137
  %139 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 24), align 16, !tbaa !8
  %140 = fadd contract float %138, %139
  %141 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 25), align 4, !tbaa !8
  %142 = fadd contract float %140, %141
  %143 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 26), align 8, !tbaa !8
  %144 = fadd contract float %142, %143
  %145 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 27), align 4, !tbaa !8
  %146 = fadd contract float %144, %145
  %147 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 28), align 16, !tbaa !8
  %148 = fadd contract float %146, %147
  %149 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 29), align 4, !tbaa !8
  %150 = fadd contract float %148, %149
  %151 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 30), align 8, !tbaa !8
  %152 = fadd contract float %150, %151
  %153 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16CorrelateData_1diiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 31), align 4, !tbaa !8
  %154 = fadd contract float %152, %153
  %155 = mul nsw i32 %76, %3
  %156 = add i32 %155, %23
  %157 = mul i32 %156, %2
  %158 = fdiv contract float %154, %48
  %159 = add i32 %50, %157
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %18, i64 %160
  store float %158, float addrspace(1)* %161, align 4, !tbaa !8
  br label %192

162:                                              ; preds = %174
  %163 = add nuw nsw i32 %84, 1
  %164 = icmp eq i32 %163, %10
  br i1 %164, label %89, label %82, !llvm.loop !14

165:                                              ; preds = %82, %174
  %166 = phi float [ %83, %82 ], [ %175, %174 ]
  %167 = phi i32 [ 0, %82 ], [ %176, %174 ]
  %168 = add nsw i32 %167, %85
  %169 = mul nsw i32 %168, %15
  br i1 %42, label %170, label %174

170:                                              ; preds = %165
  %171 = add nsw i32 %88, %167
  %172 = mul nsw i32 %171, %15
  br label %178

173:                                              ; preds = %178
  store float %189, float addrspace(3)* %41, align 4, !tbaa !8
  br label %174

174:                                              ; preds = %173, %165
  %175 = phi float [ %189, %173 ], [ %166, %165 ]
  %176 = add nuw nsw i32 %167, 1
  %177 = icmp eq i32 %176, %10
  br i1 %177, label %162, label %165, !llvm.loop !15

178:                                              ; preds = %170, %178
  %179 = phi float [ %166, %170 ], [ %189, %178 ]
  %180 = phi i32 [ %26, %170 ], [ %190, %178 ]
  %181 = add nsw i32 %180, %169
  %182 = add nsw i32 %180, %172
  %183 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @patch_data_char to float addrspace(3)*), i32 %181
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !8
  %185 = sext i32 %182 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %17, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !8
  %188 = fmul contract float %184, %187
  %189 = fadd contract float %179, %188
  %190 = add nuw nsw i32 %180, 32
  %191 = icmp slt i32 %190, %15
  br i1 %191, label %178, label %173, !llvm.loop !16

192:                                              ; preds = %90, %89
  %193 = add nuw nsw i32 %76, 1
  %194 = icmp eq i32 %193, %4
  br i1 %194, label %74, label %75, !llvm.loop !17
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
