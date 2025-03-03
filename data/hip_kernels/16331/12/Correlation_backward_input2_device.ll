; ModuleID = '../data/hip_kernels/16331/12/main.cu'
source_filename = "../data/hip_kernels/16331/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27Correlation_backward_input2iPfiiiS_iiiS_iiiii(i32 %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, float addrspace(1)* nocapture readonly %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14) local_unnamed_addr #0 {
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
  %29 = shl nsw i32 %10, 1
  %30 = add nsw i32 %29, %4
  %31 = mul i32 %11, %2
  %32 = mul i32 %31, %11
  %33 = sitofp i32 %32 to float
  %34 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %23
  store float 0.000000e+00, float addrspace(3)* %34, align 4, !tbaa !5
  %35 = icmp slt i32 %23, %6
  br i1 %35, label %36, label %49

36:                                               ; preds = %15
  %37 = add nsw i32 %29, %3
  %38 = add i32 %25, %12
  %39 = sub i32 %21, %38
  %40 = sub i32 %18, %38
  %41 = sub i32 %25, %12
  %42 = add i32 %41, %21
  %43 = add i32 %41, %18
  %44 = add nsw i32 %8, -1
  %45 = add nsw i32 %7, -1
  %46 = mul i32 %37, %0
  %47 = add i32 %46, %18
  %48 = mul i32 %6, %0
  br label %51

49:                                               ; preds = %123, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %50 = icmp eq i32 %23, 0
  br i1 %50, label %137, label %205

51:                                               ; preds = %36, %123
  %52 = phi float [ 0.000000e+00, %36 ], [ %124, %123 ]
  %53 = phi i32 [ %23, %36 ], [ %125, %123 ]
  %54 = freeze i32 %53
  %55 = freeze i32 %28
  %56 = sdiv i32 %54, %55
  %57 = mul i32 %56, %55
  %58 = sub i32 %54, %57
  %59 = sub i32 %26, %58
  %60 = mul i32 %59, %14
  %61 = sub i32 %26, %56
  %62 = mul i32 %61, %14
  %63 = add i32 %39, %60
  %64 = sdiv i32 %63, %13
  %65 = add i32 %40, %62
  %66 = sdiv i32 %65, %13
  %67 = add i32 %42, %60
  %68 = sdiv i32 %67, %13
  %69 = add i32 %43, %62
  %70 = sdiv i32 %69, %13
  %71 = icmp sgt i32 %68, -1
  %72 = icmp sgt i32 %70, -1
  %73 = select i1 %71, i1 %72, i1 false
  %74 = icmp slt i32 %64, %8
  %75 = select i1 %73, i1 %74, i1 false
  %76 = icmp slt i32 %66, %7
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %78, label %123

78:                                               ; preds = %51
  %79 = icmp sgt i32 %64, %68
  %80 = icmp sgt i32 %66, %70
  %81 = select i1 %79, i1 true, i1 %80
  br i1 %81, label %123, label %82

82:                                               ; preds = %78
  %83 = tail call i32 @llvm.smax.i32(i32 %64, i32 0)
  %84 = tail call i32 @llvm.smin.i32(i32 %44, i32 %68)
  %85 = tail call i32 @llvm.smax.i32(i32 %66, i32 0)
  %86 = tail call i32 @llvm.smin.i32(i32 %45, i32 %70)
  %87 = add i32 %60, %21
  %88 = add i32 %47, %62
  %89 = mul i32 %88, %30
  %90 = add i32 %87, %89
  %91 = mul i32 %90, %2
  %92 = add i32 %91, %22
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %9, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = icmp sgt i32 %85, %86
  br i1 %96, label %123, label %97

97:                                               ; preds = %82
  %98 = icmp sgt i32 %83, %84
  %99 = add i32 %53, %48
  %100 = mul i32 %99, %7
  br label %101

101:                                              ; preds = %97, %108
  %102 = phi float [ %52, %97 ], [ %109, %108 ]
  %103 = phi i32 [ %85, %97 ], [ %110, %108 ]
  br i1 %98, label %108, label %104

104:                                              ; preds = %101
  %105 = add i32 %100, %103
  %106 = mul i32 %105, %8
  br label %112

107:                                              ; preds = %112
  store float %120, float addrspace(3)* %34, align 4, !tbaa !5
  br label %108

108:                                              ; preds = %107, %101
  %109 = phi float [ %120, %107 ], [ %102, %101 ]
  %110 = add nuw nsw i32 %103, 1
  %111 = icmp slt i32 %103, %86
  br i1 %111, label %101, label %123, !llvm.loop !10

112:                                              ; preds = %104, %112
  %113 = phi float [ %102, %104 ], [ %120, %112 ]
  %114 = phi i32 [ %83, %104 ], [ %121, %112 ]
  %115 = add i32 %114, %106
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %5, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5, !amdgpu.noclobber !9
  %119 = fmul contract float %95, %118
  %120 = fadd contract float %113, %119
  %121 = add nuw nsw i32 %114, 1
  %122 = icmp slt i32 %114, %84
  br i1 %122, label %112, label %107, !llvm.loop !12

123:                                              ; preds = %108, %82, %78, %51
  %124 = phi float [ %52, %82 ], [ %52, %78 ], [ %52, %51 ], [ %109, %108 ]
  %125 = add nuw nsw i32 %53, 512
  %126 = icmp slt i32 %125, %6
  br i1 %126, label %51, label %49, !llvm.loop !13

127:                                              ; preds = %137
  %128 = mul i32 %2, %0
  %129 = add i32 %128, %22
  %130 = mul i32 %129, %3
  %131 = add i32 %130, %17
  %132 = mul i32 %131, %4
  %133 = add i32 %132, %20
  %134 = fdiv contract float %202, %33
  %135 = sext i32 %133 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  store float %134, float addrspace(1)* %136, align 4, !tbaa !5
  br label %205

137:                                              ; preds = %49, %137
  %138 = phi i32 [ %203, %137 ], [ 0, %49 ]
  %139 = phi float [ %202, %137 ], [ 0.000000e+00, %49 ]
  %140 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %138
  %141 = load float, float addrspace(3)* %140, align 16, !tbaa !5
  %142 = fadd contract float %139, %141
  %143 = or i32 %138, 1
  %144 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %143
  %145 = load float, float addrspace(3)* %144, align 4, !tbaa !5
  %146 = fadd contract float %142, %145
  %147 = or i32 %138, 2
  %148 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %147
  %149 = load float, float addrspace(3)* %148, align 8, !tbaa !5
  %150 = fadd contract float %146, %149
  %151 = or i32 %138, 3
  %152 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %151
  %153 = load float, float addrspace(3)* %152, align 4, !tbaa !5
  %154 = fadd contract float %150, %153
  %155 = or i32 %138, 4
  %156 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %155
  %157 = load float, float addrspace(3)* %156, align 16, !tbaa !5
  %158 = fadd contract float %154, %157
  %159 = or i32 %138, 5
  %160 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %159
  %161 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %162 = fadd contract float %158, %161
  %163 = or i32 %138, 6
  %164 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %163
  %165 = load float, float addrspace(3)* %164, align 8, !tbaa !5
  %166 = fadd contract float %162, %165
  %167 = or i32 %138, 7
  %168 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %167
  %169 = load float, float addrspace(3)* %168, align 4, !tbaa !5
  %170 = fadd contract float %166, %169
  %171 = or i32 %138, 8
  %172 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %171
  %173 = load float, float addrspace(3)* %172, align 16, !tbaa !5
  %174 = fadd contract float %170, %173
  %175 = or i32 %138, 9
  %176 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %175
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !5
  %178 = fadd contract float %174, %177
  %179 = or i32 %138, 10
  %180 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %179
  %181 = load float, float addrspace(3)* %180, align 8, !tbaa !5
  %182 = fadd contract float %178, %181
  %183 = or i32 %138, 11
  %184 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %183
  %185 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %186 = fadd contract float %182, %185
  %187 = or i32 %138, 12
  %188 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %187
  %189 = load float, float addrspace(3)* %188, align 16, !tbaa !5
  %190 = fadd contract float %186, %189
  %191 = or i32 %138, 13
  %192 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %191
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !5
  %194 = fadd contract float %190, %193
  %195 = or i32 %138, 14
  %196 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %195
  %197 = load float, float addrspace(3)* %196, align 8, !tbaa !5
  %198 = fadd contract float %194, %197
  %199 = or i32 %138, 15
  %200 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ27Correlation_backward_input2iPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %199
  %201 = load float, float addrspace(3)* %200, align 4, !tbaa !5
  %202 = fadd contract float %198, %201
  %203 = add nuw nsw i32 %138, 16
  %204 = icmp eq i32 %203, 512
  br i1 %204, label %127, label %137, !llvm.loop !14

205:                                              ; preds = %127, %49
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
