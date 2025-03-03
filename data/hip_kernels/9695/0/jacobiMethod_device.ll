; ModuleID = '../data/hip_kernels/9695/0/main.cu'
source_filename = "../data/hip_kernels/9695/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sharedMem = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12jacobiMethodPfS_iifif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, float %4, i32 %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = shl nsw i32 %5, 1
  %24 = add i32 %23, %15
  %25 = add i32 %23, %21
  %26 = mul nsw i32 %3, %2
  %27 = mul nsw i32 %25, %24
  %28 = icmp slt i32 %8, %24
  br i1 %28, label %29, label %41

29:                                               ; preds = %7
  %30 = icmp slt i32 %9, %25
  %31 = sub i32 %22, %5
  %32 = sub i32 %16, %5
  %33 = shl nsw i32 %27, 1
  br label %34

34:                                               ; preds = %29, %54
  %35 = phi i32 [ %8, %29 ], [ %55, %54 ]
  br i1 %30, label %36, label %54

36:                                               ; preds = %34
  %37 = mul nsw i32 %35, %24
  %38 = add i32 %31, %35
  %39 = mul nsw i32 %38, %2
  %40 = add i32 %32, %39
  br label %57

41:                                               ; preds = %54, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = icmp sgt i32 %5, 0
  br i1 %42, label %43, label %83

43:                                               ; preds = %41
  %44 = icmp slt i32 %9, %25
  %45 = shl nsw i32 %27, 1
  %46 = add i32 %27, %25
  %47 = add nsw i32 %24, -1
  %48 = sub i32 %25, %27
  %49 = xor i32 %27, -1
  %50 = add nsw i32 %25, -1
  %51 = sub i32 1, %27
  %52 = fmul contract float %4, %4
  %53 = fmul contract float %52, 2.500000e-01
  br label %81

54:                                               ; preds = %73, %34
  %55 = add i32 %35, %15
  %56 = icmp slt i32 %55, %24
  br i1 %56, label %34, label %41, !llvm.loop !7

57:                                               ; preds = %36, %73
  %58 = phi i32 [ %9, %36 ], [ %79, %73 ]
  %59 = add nsw i32 %58, %37
  %60 = add i32 %40, %58
  %61 = icmp sgt i32 %60, -1
  %62 = icmp slt i32 %60, %26
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %64, label %71

64:                                               ; preds = %57
  %65 = zext i32 %60 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !9, !amdgpu.noclobber !6
  %68 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %59
  store float %67, float addrspace(3)* %68, align 4, !tbaa !9
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !9, !amdgpu.noclobber !6
  br label %73

71:                                               ; preds = %57
  %72 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %59
  store float 0.000000e+00, float addrspace(3)* %72, align 4, !tbaa !9
  br label %73

73:                                               ; preds = %71, %64
  %74 = phi float [ 0.000000e+00, %71 ], [ %70, %64 ]
  %75 = add nsw i32 %59, %27
  %76 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %75
  store float %74, float addrspace(3)* %76, align 4, !tbaa !9
  %77 = add nsw i32 %59, %33
  %78 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %77
  store float 0.000000e+00, float addrspace(3)* %78, align 4, !tbaa !9
  %79 = add i32 %58, %21
  %80 = icmp slt i32 %79, %25
  br i1 %80, label %57, label %54, !llvm.loop !13

81:                                               ; preds = %43, %157
  %82 = phi i32 [ 0, %43 ], [ %158, %157 ]
  br i1 %28, label %90, label %97

83:                                               ; preds = %157, %41
  br i1 %28, label %84, label %182

84:                                               ; preds = %83
  %85 = icmp slt i32 %9, %25
  %86 = sub nsw i32 %24, %5
  %87 = sub i32 %22, %5
  %88 = sub i32 %16, %5
  %89 = shl nsw i32 %27, 1
  br label %172

90:                                               ; preds = %81, %98
  %91 = phi i32 [ %99, %98 ], [ %8, %81 ]
  br i1 %44, label %92, label %98

92:                                               ; preds = %90
  %93 = mul nsw i32 %91, %24
  %94 = icmp sgt i32 %91, 1
  %95 = icmp slt i32 %91, %47
  %96 = icmp ne i32 %91, %47
  br label %101

97:                                               ; preds = %98, %81
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %28, label %152, label %157

98:                                               ; preds = %149, %90
  %99 = add i32 %91, %15
  %100 = icmp slt i32 %99, %24
  br i1 %100, label %90, label %97, !llvm.loop !14

101:                                              ; preds = %92, %149
  %102 = phi i32 [ %9, %92 ], [ %150, %149 ]
  %103 = add nsw i32 %102, %93
  %104 = add nsw i32 %103, %45
  %105 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %104
  store float 0.000000e+00, float addrspace(3)* %105, align 4, !tbaa !9
  br i1 %94, label %106, label %112

106:                                              ; preds = %101
  %107 = sub i32 %104, %46
  %108 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %107
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !9
  %110 = fmul contract float %109, 2.500000e-01
  %111 = fadd contract float %110, 0.000000e+00
  store float %111, float addrspace(3)* %105, align 4, !tbaa !9
  br label %112

112:                                              ; preds = %106, %101
  %113 = phi float [ %111, %106 ], [ 0.000000e+00, %101 ]
  br i1 %95, label %114, label %120

114:                                              ; preds = %112
  %115 = add i32 %48, %104
  %116 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %115
  %117 = load float, float addrspace(3)* %116, align 4, !tbaa !9
  %118 = fmul contract float %117, 2.500000e-01
  %119 = fadd contract float %113, %118
  store float %119, float addrspace(3)* %105, align 4, !tbaa !9
  br label %120

120:                                              ; preds = %114, %112
  %121 = phi float [ %119, %114 ], [ %113, %112 ]
  %122 = icmp sgt i32 %102, 1
  br i1 %122, label %123, label %129

123:                                              ; preds = %120
  %124 = add i32 %104, %49
  %125 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %124
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !9
  %127 = fmul contract float %126, 2.500000e-01
  %128 = fadd contract float %121, %127
  store float %128, float addrspace(3)* %105, align 4, !tbaa !9
  br label %129

129:                                              ; preds = %123, %120
  %130 = phi float [ %128, %123 ], [ %121, %120 ]
  %131 = icmp slt i32 %102, %50
  br i1 %131, label %132, label %138

132:                                              ; preds = %129
  %133 = add i32 %51, %104
  %134 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !9
  %136 = fmul contract float %135, 2.500000e-01
  %137 = fadd contract float %130, %136
  store float %137, float addrspace(3)* %105, align 4, !tbaa !9
  br label %138

138:                                              ; preds = %132, %129
  %139 = phi float [ %137, %132 ], [ %130, %129 ]
  %140 = icmp ne i32 %102, %50
  %141 = select i1 %96, i1 %140, i1 false
  %142 = icmp sgt i32 %103, -1
  %143 = select i1 %141, i1 %142, i1 false
  br i1 %143, label %144, label %149

144:                                              ; preds = %138
  %145 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %103
  %146 = load float, float addrspace(3)* %145, align 4, !tbaa !9
  %147 = fmul contract float %53, %146
  %148 = fadd contract float %139, %147
  store float %148, float addrspace(3)* %105, align 4, !tbaa !9
  br label %149

149:                                              ; preds = %144, %138
  %150 = add i32 %102, %21
  %151 = icmp slt i32 %150, %25
  br i1 %151, label %101, label %98, !llvm.loop !15

152:                                              ; preds = %97, %160
  %153 = phi i32 [ %161, %160 ], [ %8, %97 ]
  br i1 %44, label %154, label %160

154:                                              ; preds = %152
  %155 = mul nsw i32 %153, %24
  %156 = add i32 %155, %45
  br label %163

157:                                              ; preds = %160, %97
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %158 = add nuw nsw i32 %82, 1
  %159 = icmp eq i32 %158, %5
  br i1 %159, label %83, label %81, !llvm.loop !16

160:                                              ; preds = %163, %152
  %161 = add i32 %153, %15
  %162 = icmp slt i32 %161, %24
  br i1 %162, label %152, label %157, !llvm.loop !17

163:                                              ; preds = %154, %163
  %164 = phi i32 [ %9, %154 ], [ %170, %163 ]
  %165 = add i32 %156, %164
  %166 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %165
  %167 = load float, float addrspace(3)* %166, align 4, !tbaa !9
  %168 = sub nsw i32 %165, %27
  %169 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %168
  store float %167, float addrspace(3)* %169, align 4, !tbaa !9
  %170 = add i32 %164, %21
  %171 = icmp slt i32 %170, %25
  br i1 %171, label %163, label %160, !llvm.loop !18

172:                                              ; preds = %84, %183
  %173 = phi i32 [ %8, %84 ], [ %184, %183 ]
  br i1 %85, label %174, label %183

174:                                              ; preds = %172
  %175 = icmp sge i32 %173, %5
  %176 = icmp slt i32 %173, %86
  %177 = add i32 %87, %173
  %178 = mul nsw i32 %177, %2
  %179 = add i32 %88, %178
  %180 = mul nsw i32 %173, %24
  %181 = add i32 %180, %89
  br label %186

182:                                              ; preds = %183, %83
  ret void

183:                                              ; preds = %204, %172
  %184 = add i32 %173, %15
  %185 = icmp slt i32 %184, %24
  br i1 %185, label %172, label %182, !llvm.loop !19

186:                                              ; preds = %174, %204
  %187 = phi i32 [ %9, %174 ], [ %205, %204 ]
  %188 = icmp sge i32 %187, %5
  %189 = select i1 %175, i1 %188, i1 false
  %190 = icmp slt i32 %187, %86
  %191 = select i1 %189, i1 %176, i1 false
  %192 = select i1 %191, i1 %190, i1 false
  br i1 %192, label %193, label %204

193:                                              ; preds = %186
  %194 = add i32 %179, %187
  %195 = icmp sgt i32 %194, 0
  %196 = icmp slt i32 %194, %26
  %197 = select i1 %195, i1 %196, i1 false
  br i1 %197, label %198, label %204

198:                                              ; preds = %193
  %199 = add i32 %181, %187
  %200 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %199
  %201 = load float, float addrspace(3)* %200, align 4, !tbaa !9
  %202 = zext i32 %194 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %1, i64 %202
  store float %201, float addrspace(1)* %203, align 4, !tbaa !9
  br label %204

204:                                              ; preds = %193, %198, %186
  %205 = add i32 %187, %21
  %206 = icmp slt i32 %205, %25
  br i1 %206, label %186, label %183, !llvm.loop !20
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !8}
!17 = distinct !{!17, !8}
!18 = distinct !{!18, !8}
!19 = distinct !{!19, !8}
!20 = distinct !{!20, !8}
