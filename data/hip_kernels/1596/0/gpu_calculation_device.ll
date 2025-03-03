; ModuleID = '../data/hip_kernels/1596/0/main.cu'
source_filename = "../data/hip_kernels/1596/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z15gpu_calculationffffPijiii(float %0, float %1, float %2, float %3, i32 addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = zext i32 %18 to i64
  %20 = icmp ult i32 %18, %5
  br i1 %20, label %21, label %183

21:                                               ; preds = %9
  %22 = sext i32 %8 to i64
  %23 = add nsw i64 %19, %22
  %24 = sext i32 %6 to i64
  %25 = udiv i64 %23, %24
  %26 = trunc i64 %25 to i32
  %27 = sext i32 %7 to i64
  %28 = urem i64 %23, %27
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %26 to float
  %31 = fmul contract float %30, %2
  %32 = fadd contract float %31, %0
  %33 = sitofp i32 %29 to float
  %34 = fmul contract float %33, %3
  %35 = fadd contract float %34, %1
  br label %36

36:                                               ; preds = %159, %21
  %37 = phi i32 [ 1, %21 ], [ %160, %159 ]
  %38 = phi float [ 0.000000e+00, %21 ], [ %154, %159 ]
  %39 = phi float [ 0.000000e+00, %21 ], [ %151, %159 ]
  %40 = fmul contract float %39, %39
  %41 = fmul contract float %38, %38
  %42 = fsub contract float %40, %41
  %43 = fadd contract float %32, %42
  %44 = fmul contract float %39, 2.000000e+00
  %45 = fmul contract float %44, %38
  %46 = fadd contract float %35, %45
  %47 = fmul contract float %43, %43
  %48 = fmul contract float %46, %46
  %49 = fadd contract float %48, %47
  %50 = fcmp contract ogt float %49, 4.000000e+00
  br i1 %50, label %180, label %51

51:                                               ; preds = %36
  %52 = fmul contract float %43, %43
  %53 = fmul contract float %46, %46
  %54 = fsub contract float %52, %53
  %55 = fadd contract float %32, %54
  %56 = fmul contract float %43, 2.000000e+00
  %57 = fmul contract float %56, %46
  %58 = fadd contract float %35, %57
  %59 = fmul contract float %55, %55
  %60 = fmul contract float %58, %58
  %61 = fadd contract float %60, %59
  %62 = fcmp contract ogt float %61, 4.000000e+00
  br i1 %62, label %178, label %63

63:                                               ; preds = %51
  %64 = fmul contract float %55, %55
  %65 = fmul contract float %58, %58
  %66 = fsub contract float %64, %65
  %67 = fadd contract float %32, %66
  %68 = fmul contract float %55, 2.000000e+00
  %69 = fmul contract float %68, %58
  %70 = fadd contract float %35, %69
  %71 = fmul contract float %67, %67
  %72 = fmul contract float %70, %70
  %73 = fadd contract float %72, %71
  %74 = fcmp contract ogt float %73, 4.000000e+00
  br i1 %74, label %176, label %75

75:                                               ; preds = %63
  %76 = fmul contract float %67, %67
  %77 = fmul contract float %70, %70
  %78 = fsub contract float %76, %77
  %79 = fadd contract float %32, %78
  %80 = fmul contract float %67, 2.000000e+00
  %81 = fmul contract float %80, %70
  %82 = fadd contract float %35, %81
  %83 = fmul contract float %79, %79
  %84 = fmul contract float %82, %82
  %85 = fadd contract float %84, %83
  %86 = fcmp contract ogt float %85, 4.000000e+00
  br i1 %86, label %174, label %87

87:                                               ; preds = %75
  %88 = fmul contract float %79, %79
  %89 = fmul contract float %82, %82
  %90 = fsub contract float %88, %89
  %91 = fadd contract float %32, %90
  %92 = fmul contract float %79, 2.000000e+00
  %93 = fmul contract float %92, %82
  %94 = fadd contract float %35, %93
  %95 = fmul contract float %91, %91
  %96 = fmul contract float %94, %94
  %97 = fadd contract float %96, %95
  %98 = fcmp contract ogt float %97, 4.000000e+00
  br i1 %98, label %172, label %99

99:                                               ; preds = %87
  %100 = fmul contract float %91, %91
  %101 = fmul contract float %94, %94
  %102 = fsub contract float %100, %101
  %103 = fadd contract float %32, %102
  %104 = fmul contract float %91, 2.000000e+00
  %105 = fmul contract float %104, %94
  %106 = fadd contract float %35, %105
  %107 = fmul contract float %103, %103
  %108 = fmul contract float %106, %106
  %109 = fadd contract float %108, %107
  %110 = fcmp contract ogt float %109, 4.000000e+00
  br i1 %110, label %170, label %111

111:                                              ; preds = %99
  %112 = fmul contract float %103, %103
  %113 = fmul contract float %106, %106
  %114 = fsub contract float %112, %113
  %115 = fadd contract float %32, %114
  %116 = fmul contract float %103, 2.000000e+00
  %117 = fmul contract float %116, %106
  %118 = fadd contract float %35, %117
  %119 = fmul contract float %115, %115
  %120 = fmul contract float %118, %118
  %121 = fadd contract float %120, %119
  %122 = fcmp contract ogt float %121, 4.000000e+00
  br i1 %122, label %168, label %123

123:                                              ; preds = %111
  %124 = fmul contract float %115, %115
  %125 = fmul contract float %118, %118
  %126 = fsub contract float %124, %125
  %127 = fadd contract float %32, %126
  %128 = fmul contract float %115, 2.000000e+00
  %129 = fmul contract float %128, %118
  %130 = fadd contract float %35, %129
  %131 = fmul contract float %127, %127
  %132 = fmul contract float %130, %130
  %133 = fadd contract float %132, %131
  %134 = fcmp contract ogt float %133, 4.000000e+00
  br i1 %134, label %166, label %135

135:                                              ; preds = %123
  %136 = fmul contract float %127, %127
  %137 = fmul contract float %130, %130
  %138 = fsub contract float %136, %137
  %139 = fadd contract float %32, %138
  %140 = fmul contract float %127, 2.000000e+00
  %141 = fmul contract float %140, %130
  %142 = fadd contract float %35, %141
  %143 = fmul contract float %139, %139
  %144 = fmul contract float %142, %142
  %145 = fadd contract float %144, %143
  %146 = fcmp contract ogt float %145, 4.000000e+00
  br i1 %146, label %164, label %147

147:                                              ; preds = %135
  %148 = fmul contract float %139, %139
  %149 = fmul contract float %142, %142
  %150 = fsub contract float %148, %149
  %151 = fadd contract float %32, %150
  %152 = fmul contract float %139, 2.000000e+00
  %153 = fmul contract float %152, %142
  %154 = fadd contract float %35, %153
  %155 = fmul contract float %151, %151
  %156 = fmul contract float %154, %154
  %157 = fadd contract float %156, %155
  %158 = fcmp contract ogt float %157, 4.000000e+00
  br i1 %158, label %162, label %159

159:                                              ; preds = %147
  %160 = add nuw nsw i32 %37, 10
  %161 = icmp eq i32 %160, 1001
  br i1 %161, label %180, label %36, !llvm.loop !7

162:                                              ; preds = %147
  %163 = add nuw nsw i32 %37, 9
  br label %180

164:                                              ; preds = %135
  %165 = add nuw nsw i32 %37, 8
  br label %180

166:                                              ; preds = %123
  %167 = add nuw nsw i32 %37, 7
  br label %180

168:                                              ; preds = %111
  %169 = add nuw nsw i32 %37, 6
  br label %180

170:                                              ; preds = %99
  %171 = add nuw nsw i32 %37, 5
  br label %180

172:                                              ; preds = %87
  %173 = add nuw nsw i32 %37, 4
  br label %180

174:                                              ; preds = %75
  %175 = add nuw nsw i32 %37, 3
  br label %180

176:                                              ; preds = %63
  %177 = add nuw nsw i32 %37, 2
  br label %180

178:                                              ; preds = %51
  %179 = add nuw nsw i32 %37, 1
  br label %180

180:                                              ; preds = %36, %159, %178, %176, %174, %172, %170, %168, %166, %164, %162
  %181 = phi i32 [ %163, %162 ], [ %165, %164 ], [ %167, %166 ], [ %169, %168 ], [ %171, %170 ], [ %173, %172 ], [ %175, %174 ], [ %177, %176 ], [ %179, %178 ], [ -1, %159 ], [ %37, %36 ]
  %182 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %19
  store i32 %181, i32 addrspace(1)* %182, align 4, !tbaa !9
  br label %183

183:                                              ; preds = %180, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
