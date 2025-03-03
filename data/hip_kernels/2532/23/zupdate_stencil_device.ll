; ModuleID = '../data/hip_kernels/2532/23/main.cu'
source_filename = "../data/hip_kernels/2532/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15zupdate_stencilPfS_S_S_S_ffii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture readonly %4, float %5, float %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = mul nsw i32 %26, %7
  %28 = add nsw i32 %27, %18
  %29 = icmp slt i32 %18, %7
  %30 = icmp slt i32 %26, %8
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %67

32:                                               ; preds = %9
  %33 = add nsw i32 %7, -1
  %34 = icmp slt i32 %18, %33
  br i1 %34, label %35, label %40

35:                                               ; preds = %32
  %36 = sext i32 %28 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = fadd contract float %38, 0.000000e+00
  br label %40

40:                                               ; preds = %35, %32
  %41 = phi float [ %39, %35 ], [ 0.000000e+00, %32 ]
  %42 = icmp sgt i32 %18, 0
  br i1 %42, label %43, label %49

43:                                               ; preds = %40
  %44 = add nsw i32 %28, -1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fsub contract float %41, %47
  br label %49

49:                                               ; preds = %43, %40
  %50 = phi float [ %48, %43 ], [ %41, %40 ]
  %51 = add nsw i32 %8, -1
  %52 = icmp slt i32 %26, %51
  br i1 %52, label %53, label %58

53:                                               ; preds = %49
  %54 = sext i32 %28 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = fadd contract float %50, %56
  br label %58

58:                                               ; preds = %53, %49
  %59 = phi float [ %57, %53 ], [ %50, %49 ]
  %60 = icmp sgt i32 %26, 0
  br i1 %60, label %61, label %67

61:                                               ; preds = %58
  %62 = sub nsw i32 %28, %7
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fsub contract float %59, %65
  br label %67

67:                                               ; preds = %58, %61, %9
  %68 = phi float [ 0.000000e+00, %9 ], [ %66, %61 ], [ %59, %58 ]
  %69 = add nsw i32 %28, 1
  %70 = add nsw i32 %18, 1
  %71 = icmp slt i32 %70, %7
  %72 = select i1 %71, i1 %30, i1 false
  br i1 %72, label %73, label %107

73:                                               ; preds = %67
  %74 = add nsw i32 %7, -1
  %75 = icmp slt i32 %70, %74
  br i1 %75, label %76, label %81

76:                                               ; preds = %73
  %77 = sext i32 %69 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fadd contract float %79, 0.000000e+00
  br label %81

81:                                               ; preds = %76, %73
  %82 = phi float [ %80, %76 ], [ 0.000000e+00, %73 ]
  %83 = icmp sgt i32 %18, -1
  br i1 %83, label %84, label %89

84:                                               ; preds = %81
  %85 = sext i32 %28 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fsub contract float %82, %87
  br label %89

89:                                               ; preds = %84, %81
  %90 = phi float [ %88, %84 ], [ %82, %81 ]
  %91 = add nsw i32 %8, -1
  %92 = icmp slt i32 %26, %91
  br i1 %92, label %93, label %98

93:                                               ; preds = %89
  %94 = sext i32 %69 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fadd contract float %90, %96
  br label %98

98:                                               ; preds = %93, %89
  %99 = phi float [ %97, %93 ], [ %90, %89 ]
  %100 = icmp sgt i32 %26, 0
  br i1 %100, label %101, label %107

101:                                              ; preds = %98
  %102 = sub nsw i32 %69, %7
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fsub contract float %99, %105
  br label %107

107:                                              ; preds = %98, %101, %67
  %108 = phi float [ 0.000000e+00, %67 ], [ %106, %101 ], [ %99, %98 ]
  %109 = add nsw i32 %28, %7
  %110 = add nsw i32 %26, 1
  %111 = icmp slt i32 %110, %8
  %112 = select i1 %29, i1 %111, i1 false
  br i1 %112, label %113, label %147

113:                                              ; preds = %107
  %114 = add nsw i32 %7, -1
  %115 = icmp slt i32 %18, %114
  br i1 %115, label %116, label %121

116:                                              ; preds = %113
  %117 = sext i32 %109 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = fadd contract float %119, 0.000000e+00
  br label %121

121:                                              ; preds = %116, %113
  %122 = phi float [ %120, %116 ], [ 0.000000e+00, %113 ]
  %123 = icmp sgt i32 %18, 0
  br i1 %123, label %124, label %130

124:                                              ; preds = %121
  %125 = add nsw i32 %109, -1
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !5
  %129 = fsub contract float %122, %128
  br label %130

130:                                              ; preds = %124, %121
  %131 = phi float [ %129, %124 ], [ %122, %121 ]
  %132 = add nsw i32 %8, -1
  %133 = icmp slt i32 %110, %132
  br i1 %133, label %134, label %139

134:                                              ; preds = %130
  %135 = sext i32 %109 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fadd contract float %131, %137
  br label %139

139:                                              ; preds = %134, %130
  %140 = phi float [ %138, %134 ], [ %131, %130 ]
  %141 = icmp sgt i32 %26, -1
  br i1 %141, label %142, label %147

142:                                              ; preds = %139
  %143 = sext i32 %28 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = fsub contract float %140, %145
  br label %147

147:                                              ; preds = %139, %142, %107
  %148 = phi float [ 0.000000e+00, %107 ], [ %146, %142 ], [ %140, %139 ]
  %149 = sext i32 %28 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %4, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = fmul contract float %151, %6
  %153 = fsub contract float %68, %152
  br i1 %31, label %154, label %212

154:                                              ; preds = %147
  %155 = sext i32 %109 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %4, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = fmul contract float %157, %6
  %159 = fsub contract float %148, %158
  %160 = sext i32 %69 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %4, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7, !amdgpu.noclobber !5
  %163 = fmul contract float %162, %6
  %164 = fsub contract float %108, %163
  %165 = add nsw i32 %7, -1
  %166 = icmp slt i32 %18, %165
  %167 = fsub contract float %164, %153
  %168 = select i1 %166, float %167, float 0.000000e+00
  %169 = add nsw i32 %8, -1
  %170 = icmp slt i32 %26, %169
  %171 = fsub contract float %159, %153
  %172 = select i1 %170, float %171, float 0.000000e+00
  %173 = fmul contract float %168, %168
  %174 = fmul contract float %172, %172
  %175 = fadd contract float %174, %173
  %176 = fcmp olt float %175, 0x39F0000000000000
  %177 = select i1 %176, float 0x41F0000000000000, float 1.000000e+00
  %178 = fmul float %175, %177
  %179 = tail call float @llvm.sqrt.f32(float %178)
  %180 = bitcast float %179 to i32
  %181 = add nsw i32 %180, -1
  %182 = bitcast i32 %181 to float
  %183 = add nsw i32 %180, 1
  %184 = bitcast i32 %183 to float
  %185 = tail call i1 @llvm.amdgcn.class.f32(float %178, i32 608)
  %186 = select i1 %176, float 0x3EF0000000000000, float 1.000000e+00
  %187 = fneg float %184
  %188 = tail call float @llvm.fma.f32(float %187, float %179, float %178)
  %189 = fcmp ogt float %188, 0.000000e+00
  %190 = fneg float %182
  %191 = tail call float @llvm.fma.f32(float %190, float %179, float %178)
  %192 = fcmp ole float %191, 0.000000e+00
  %193 = select i1 %192, float %182, float %179
  %194 = select i1 %189, float %184, float %193
  %195 = fmul float %186, %194
  %196 = select i1 %185, float %178, float %195
  %197 = fmul contract float %196, %5
  %198 = fadd contract float %197, 1.000000e+00
  %199 = fdiv contract float 1.000000e+00, %198
  %200 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !7, !amdgpu.noclobber !5
  %202 = fmul contract float %168, %5
  %203 = fadd contract float %201, %202
  %204 = fmul contract float %203, %199
  %205 = getelementptr inbounds float, float addrspace(1)* %2, i64 %149
  store float %204, float addrspace(1)* %205, align 4, !tbaa !7
  %206 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !7
  %208 = fmul contract float %172, %5
  %209 = fadd contract float %207, %208
  %210 = fmul contract float %209, %199
  %211 = getelementptr inbounds float, float addrspace(1)* %3, i64 %149
  store float %210, float addrspace(1)* %211, align 4, !tbaa !7
  br label %212

212:                                              ; preds = %154, %147
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
