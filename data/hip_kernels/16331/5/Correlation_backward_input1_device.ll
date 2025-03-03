; ModuleID = '../data/hip_kernels/16331/5/main.cu'
source_filename = "../data/hip_kernels/16331/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27Correlation_backward_input1iPfiiiS_iiiS_iiiii(i32 %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, float addrspace(1)* nocapture readonly %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %13
  %18 = add i32 %17, %10
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = mul i32 %19, %13
  %21 = add i32 %20, %10
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %24 = add nsw i32 %11, -1
  %25 = sdiv i32 %24, 2
  %26 = sdiv i32 %12, %14
  %27 = shl nsw i32 %26, 1
  %28 = add nuw nsw i32 %27, 1
  %29 = add i32 %25, %12
  %30 = sub i32 %21, %29
  %31 = sdiv i32 %30, %13
  %32 = sub i32 %18, %29
  %33 = sdiv i32 %32, %13
  %34 = sub i32 %25, %12
  %35 = add i32 %34, %21
  %36 = sdiv i32 %35, %13
  %37 = add i32 %34, %18
  %38 = sdiv i32 %37, %13
  %39 = icmp sgt i32 %36, -1
  %40 = icmp sgt i32 %38, -1
  %41 = select i1 %39, i1 %40, i1 false
  %42 = icmp slt i32 %31, %8
  %43 = select i1 %41, i1 %42, i1 false
  %44 = icmp slt i32 %33, %7
  %45 = select i1 %43, i1 %44, i1 false
  br i1 %45, label %46, label %201

46:                                               ; preds = %15
  %47 = icmp sgt i32 %31, %36
  %48 = icmp sgt i32 %33, %38
  %49 = select i1 %47, i1 true, i1 %48
  br i1 %49, label %201, label %50

50:                                               ; preds = %46
  %51 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %52 = add nsw i32 %8, -1
  %53 = tail call i32 @llvm.smin.i32(i32 %52, i32 %36)
  %54 = tail call i32 @llvm.smax.i32(i32 %33, i32 0)
  %55 = add nsw i32 %7, -1
  %56 = tail call i32 @llvm.smin.i32(i32 %55, i32 %38)
  %57 = shl nsw i32 %10, 1
  %58 = add nsw i32 %57, %4
  %59 = mul i32 %11, %2
  %60 = mul i32 %59, %11
  %61 = sitofp i32 %60 to float
  %62 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %23
  store float 0.000000e+00, float addrspace(3)* %62, align 4, !tbaa !5
  %63 = icmp slt i32 %23, %6
  br i1 %63, label %64, label %71

64:                                               ; preds = %50
  %65 = add nsw i32 %57, %3
  %66 = mul i32 %65, %0
  %67 = add i32 %66, %18
  %68 = icmp sgt i32 %54, %56
  %69 = icmp sgt i32 %51, %53
  %70 = mul i32 %6, %0
  br label %73

71:                                               ; preds = %103, %50
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = icmp eq i32 %23, 0
  br i1 %72, label %133, label %201

73:                                               ; preds = %64, %103
  %74 = phi float [ 0.000000e+00, %64 ], [ %104, %103 ]
  %75 = phi i32 [ %23, %64 ], [ %105, %103 ]
  %76 = freeze i32 %75
  %77 = freeze i32 %28
  %78 = sdiv i32 %76, %77
  %79 = mul i32 %78, %77
  %80 = sub i32 %76, %79
  %81 = sub nsw i32 %80, %26
  %82 = mul nsw i32 %81, %14
  %83 = sub nsw i32 %78, %26
  %84 = mul nsw i32 %83, %14
  %85 = add i32 %67, %84
  %86 = mul i32 %85, %58
  %87 = add i32 %82, %21
  %88 = add i32 %87, %86
  %89 = mul i32 %88, %2
  %90 = add i32 %89, %22
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %9, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  br i1 %68, label %103, label %94

94:                                               ; preds = %73
  %95 = add i32 %75, %70
  %96 = mul i32 %95, %7
  br label %97

97:                                               ; preds = %94, %108
  %98 = phi float [ %74, %94 ], [ %109, %108 ]
  %99 = phi i32 [ %54, %94 ], [ %110, %108 ]
  br i1 %69, label %108, label %100

100:                                              ; preds = %97
  %101 = add i32 %96, %99
  %102 = mul i32 %101, %8
  br label %112

103:                                              ; preds = %108, %73
  %104 = phi float [ %74, %73 ], [ %109, %108 ]
  %105 = add nuw nsw i32 %75, 512
  %106 = icmp slt i32 %105, %6
  br i1 %106, label %73, label %71, !llvm.loop !10

107:                                              ; preds = %112
  store float %120, float addrspace(3)* %62, align 4, !tbaa !5
  br label %108

108:                                              ; preds = %107, %97
  %109 = phi float [ %120, %107 ], [ %98, %97 ]
  %110 = add nuw nsw i32 %99, 1
  %111 = icmp slt i32 %99, %56
  br i1 %111, label %97, label %103, !llvm.loop !12

112:                                              ; preds = %100, %112
  %113 = phi float [ %98, %100 ], [ %120, %112 ]
  %114 = phi i32 [ %51, %100 ], [ %121, %112 ]
  %115 = add i32 %114, %102
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %5, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5, !amdgpu.noclobber !9
  %119 = fmul contract float %93, %118
  %120 = fadd contract float %113, %119
  %121 = add nuw nsw i32 %114, 1
  %122 = icmp slt i32 %114, %53
  br i1 %122, label %112, label %107, !llvm.loop !13

123:                                              ; preds = %133
  %124 = mul i32 %2, %0
  %125 = add i32 %124, %22
  %126 = mul i32 %125, %3
  %127 = add i32 %126, %17
  %128 = mul i32 %127, %4
  %129 = add i32 %128, %20
  %130 = fdiv contract float %198, %61
  %131 = sext i32 %129 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  store float %130, float addrspace(1)* %132, align 4, !tbaa !5
  br label %201

133:                                              ; preds = %71, %133
  %134 = phi i32 [ %199, %133 ], [ 0, %71 ]
  %135 = phi float [ %198, %133 ], [ 0.000000e+00, %71 ]
  %136 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %134
  %137 = load float, float addrspace(3)* %136, align 16, !tbaa !5
  %138 = fadd contract float %135, %137
  %139 = or i32 %134, 1
  %140 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %139
  %141 = load float, float addrspace(3)* %140, align 4, !tbaa !5
  %142 = fadd contract float %138, %141
  %143 = or i32 %134, 2
  %144 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %143
  %145 = load float, float addrspace(3)* %144, align 8, !tbaa !5
  %146 = fadd contract float %142, %145
  %147 = or i32 %134, 3
  %148 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %147
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %150 = fadd contract float %146, %149
  %151 = or i32 %134, 4
  %152 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %151
  %153 = load float, float addrspace(3)* %152, align 16, !tbaa !5
  %154 = fadd contract float %150, %153
  %155 = or i32 %134, 5
  %156 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %155
  %157 = load float, float addrspace(3)* %156, align 4, !tbaa !5
  %158 = fadd contract float %154, %157
  %159 = or i32 %134, 6
  %160 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %159
  %161 = load float, float addrspace(3)* %160, align 8, !tbaa !5
  %162 = fadd contract float %158, %161
  %163 = or i32 %134, 7
  %164 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %163
  %165 = load float, float addrspace(3)* %164, align 4, !tbaa !5
  %166 = fadd contract float %162, %165
  %167 = or i32 %134, 8
  %168 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %167
  %169 = load float, float addrspace(3)* %168, align 16, !tbaa !5
  %170 = fadd contract float %166, %169
  %171 = or i32 %134, 9
  %172 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %171
  %173 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %174 = fadd contract float %170, %173
  %175 = or i32 %134, 10
  %176 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %175
  %177 = load float, float addrspace(3)* %176, align 8, !tbaa !5
  %178 = fadd contract float %174, %177
  %179 = or i32 %134, 11
  %180 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %179
  %181 = load float, float addrspace(3)* %180, align 4, !tbaa !5
  %182 = fadd contract float %178, %181
  %183 = or i32 %134, 12
  %184 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %183
  %185 = load float, float addrspace(3)* %184, align 16, !tbaa !5
  %186 = fadd contract float %182, %185
  %187 = or i32 %134, 13
  %188 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %187
  %189 = load float, float addrspace(3)* %188, align 4, !tbaa !5
  %190 = fadd contract float %186, %189
  %191 = or i32 %134, 14
  %192 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %191
  %193 = load float, float addrspace(3)* %192, align 8, !tbaa !5
  %194 = fadd contract float %190, %193
  %195 = or i32 %134, 15
  %196 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input1iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %195
  %197 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %198 = fadd contract float %194, %197
  %199 = add nuw nsw i32 %134, 16
  %200 = icmp eq i32 %199, 512
  br i1 %200, label %123, label %133, !llvm.loop !14

201:                                              ; preds = %71, %123, %46, %15
  ret void
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
