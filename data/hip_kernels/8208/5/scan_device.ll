; ModuleID = '../data/hip_kernels/8208/5/main.cu'
source_filename = "../data/hip_kernels/8208/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4scanPfS_S_iE2XY = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4scanPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = shl nsw i32 %5, 1
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, %3
  br i1 %15, label %16, label %21

16:                                               ; preds = %4
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %6
  store float %19, float addrspace(3)* %20, align 4, !tbaa !7
  br label %21

21:                                               ; preds = %16, %4
  %22 = add i32 %14, %12
  %23 = icmp ult i32 %22, %3
  br i1 %23, label %24, label %30

24:                                               ; preds = %21
  %25 = zext i32 %22 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = add nuw nsw i32 %6, %12
  %29 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %28
  store float %27, float addrspace(3)* %29, align 4, !tbaa !7
  br label %30

30:                                               ; preds = %24, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = shl nuw nsw i32 %6, 1
  %32 = add nuw nsw i32 %31, 2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = add nuw nsw i32 %31, 1
  %34 = icmp ult i32 %6, 512
  br i1 %34, label %35, label %41

35:                                               ; preds = %30
  %36 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %31
  %37 = load float, float addrspace(3)* %36, align 8, !tbaa !7
  %38 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %33
  %39 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %40 = fadd contract float %37, %39
  store float %40, float addrspace(3)* %38, align 4, !tbaa !7
  br label %41

41:                                               ; preds = %35, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = shl nuw nsw i32 %32, 1
  %43 = add nsw i32 %42, -1
  %44 = icmp ult i32 %6, 256
  br i1 %44, label %45, label %52

45:                                               ; preds = %41
  %46 = add nsw i32 %42, -3
  %47 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %46
  %48 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %49 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %43
  %50 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %51 = fadd contract float %48, %50
  store float %51, float addrspace(3)* %49, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %45, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = shl nuw nsw i32 %32, 2
  %54 = add nsw i32 %53, -1
  %55 = icmp ult i32 %6, 128
  br i1 %55, label %56, label %63

56:                                               ; preds = %52
  %57 = add nsw i32 %53, -5
  %58 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %57
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %54
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %62 = fadd contract float %59, %61
  store float %62, float addrspace(3)* %60, align 4, !tbaa !7
  br label %63

63:                                               ; preds = %56, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = shl nuw nsw i32 %32, 3
  %65 = add nsw i32 %64, -1
  %66 = icmp ult i32 %6, 64
  br i1 %66, label %67, label %74

67:                                               ; preds = %63
  %68 = add nsw i32 %64, -9
  %69 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %71 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %65
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !7
  %73 = fadd contract float %70, %72
  store float %73, float addrspace(3)* %71, align 4, !tbaa !7
  br label %74

74:                                               ; preds = %67, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = shl nuw nsw i32 %32, 4
  %76 = add nsw i32 %75, -1
  %77 = icmp ult i32 %6, 32
  br i1 %77, label %78, label %85

78:                                               ; preds = %74
  %79 = add nsw i32 %75, -17
  %80 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %79
  %81 = load float, float addrspace(3)* %80, align 4, !tbaa !7
  %82 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %76
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %84 = fadd contract float %81, %83
  store float %84, float addrspace(3)* %82, align 4, !tbaa !7
  br label %85

85:                                               ; preds = %78, %74
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %86 = shl nuw nsw i32 %32, 5
  %87 = add nsw i32 %86, -1
  %88 = icmp ult i32 %6, 16
  br i1 %88, label %89, label %96

89:                                               ; preds = %85
  %90 = add nsw i32 %86, -33
  %91 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !7
  %93 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %87
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %95 = fadd contract float %92, %94
  store float %95, float addrspace(3)* %93, align 4, !tbaa !7
  br label %96

96:                                               ; preds = %89, %85
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %97 = shl nuw nsw i32 %32, 6
  %98 = add nsw i32 %97, -1
  %99 = icmp ult i32 %6, 8
  br i1 %99, label %100, label %107

100:                                              ; preds = %96
  %101 = add nsw i32 %97, -65
  %102 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %101
  %103 = load float, float addrspace(3)* %102, align 4, !tbaa !7
  %104 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %98
  %105 = load float, float addrspace(3)* %104, align 4, !tbaa !7
  %106 = fadd contract float %103, %105
  store float %106, float addrspace(3)* %104, align 4, !tbaa !7
  br label %107

107:                                              ; preds = %100, %96
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %108 = shl nuw nsw i32 %32, 7
  %109 = add nsw i32 %108, -1
  %110 = icmp ult i32 %6, 4
  br i1 %110, label %111, label %118

111:                                              ; preds = %107
  %112 = add nsw i32 %108, -129
  %113 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %112
  %114 = load float, float addrspace(3)* %113, align 4, !tbaa !7
  %115 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %109
  %116 = load float, float addrspace(3)* %115, align 4, !tbaa !7
  %117 = fadd contract float %114, %116
  store float %117, float addrspace(3)* %115, align 4, !tbaa !7
  br label %118

118:                                              ; preds = %111, %107
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %119 = shl nuw nsw i32 %32, 8
  %120 = add nsw i32 %119, -1
  %121 = icmp ult i32 %6, 2
  br i1 %121, label %122, label %129

122:                                              ; preds = %118
  %123 = add nsw i32 %119, -257
  %124 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %123
  %125 = load float, float addrspace(3)* %124, align 4, !tbaa !7
  %126 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %120
  %127 = load float, float addrspace(3)* %126, align 4, !tbaa !7
  %128 = fadd contract float %125, %127
  store float %128, float addrspace(3)* %126, align 4, !tbaa !7
  br label %129

129:                                              ; preds = %122, %118
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %130 = shl nuw nsw i32 %32, 9
  %131 = icmp eq i32 %6, 0
  br i1 %131, label %132, label %140

132:                                              ; preds = %129
  %133 = add nsw i32 %130, -1
  %134 = add nsw i32 %130, -513
  %135 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %134
  %136 = load float, float addrspace(3)* %135, align 4, !tbaa !7
  %137 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %133
  %138 = load float, float addrspace(3)* %137, align 4, !tbaa !7
  %139 = fadd contract float %136, %138
  store float %139, float addrspace(3)* %137, align 4, !tbaa !7
  br label %140

140:                                              ; preds = %132, %129
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %141 = icmp eq i32 %6, 0
  br i1 %141, label %142, label %149

142:                                              ; preds = %140
  %143 = add nuw nsw i32 %119, 255
  %144 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %120
  %145 = load float, float addrspace(3)* %144, align 4, !tbaa !7
  %146 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %143
  %147 = load float, float addrspace(3)* %146, align 4, !tbaa !7
  %148 = fadd contract float %145, %147
  store float %148, float addrspace(3)* %146, align 4, !tbaa !7
  br label %149

149:                                              ; preds = %142, %140
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %150 = icmp ult i32 %6, 3
  br i1 %150, label %151, label %158

151:                                              ; preds = %149
  %152 = add nuw nsw i32 %108, 127
  %153 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %109
  %154 = load float, float addrspace(3)* %153, align 4, !tbaa !7
  %155 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %152
  %156 = load float, float addrspace(3)* %155, align 4, !tbaa !7
  %157 = fadd contract float %154, %156
  store float %157, float addrspace(3)* %155, align 4, !tbaa !7
  br label %158

158:                                              ; preds = %151, %149
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %159 = icmp ult i32 %6, 7
  br i1 %159, label %160, label %167

160:                                              ; preds = %158
  %161 = add nuw nsw i32 %97, 63
  %162 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %98
  %163 = load float, float addrspace(3)* %162, align 4, !tbaa !7
  %164 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %161
  %165 = load float, float addrspace(3)* %164, align 4, !tbaa !7
  %166 = fadd contract float %163, %165
  store float %166, float addrspace(3)* %164, align 4, !tbaa !7
  br label %167

167:                                              ; preds = %160, %158
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %168 = icmp ult i32 %6, 15
  br i1 %168, label %169, label %176

169:                                              ; preds = %167
  %170 = add nuw nsw i32 %86, 31
  %171 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %87
  %172 = load float, float addrspace(3)* %171, align 4, !tbaa !7
  %173 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %170
  %174 = load float, float addrspace(3)* %173, align 4, !tbaa !7
  %175 = fadd contract float %172, %174
  store float %175, float addrspace(3)* %173, align 4, !tbaa !7
  br label %176

176:                                              ; preds = %169, %167
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %177 = icmp ult i32 %6, 31
  br i1 %177, label %178, label %185

178:                                              ; preds = %176
  %179 = add nuw nsw i32 %75, 15
  %180 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %76
  %181 = load float, float addrspace(3)* %180, align 4, !tbaa !7
  %182 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %179
  %183 = load float, float addrspace(3)* %182, align 4, !tbaa !7
  %184 = fadd contract float %181, %183
  store float %184, float addrspace(3)* %182, align 4, !tbaa !7
  br label %185

185:                                              ; preds = %178, %176
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %186 = icmp ult i32 %6, 63
  br i1 %186, label %187, label %194

187:                                              ; preds = %185
  %188 = add nuw nsw i32 %64, 7
  %189 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %65
  %190 = load float, float addrspace(3)* %189, align 4, !tbaa !7
  %191 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %188
  %192 = load float, float addrspace(3)* %191, align 4, !tbaa !7
  %193 = fadd contract float %190, %192
  store float %193, float addrspace(3)* %191, align 4, !tbaa !7
  br label %194

194:                                              ; preds = %187, %185
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %195 = icmp ult i32 %6, 127
  br i1 %195, label %196, label %203

196:                                              ; preds = %194
  %197 = add nuw nsw i32 %53, 3
  %198 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %54
  %199 = load float, float addrspace(3)* %198, align 4, !tbaa !7
  %200 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %197
  %201 = load float, float addrspace(3)* %200, align 4, !tbaa !7
  %202 = fadd contract float %199, %201
  store float %202, float addrspace(3)* %200, align 4, !tbaa !7
  br label %203

203:                                              ; preds = %196, %194
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %204 = icmp ult i32 %6, 255
  br i1 %204, label %205, label %212

205:                                              ; preds = %203
  %206 = add nuw nsw i32 %42, 1
  %207 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %43
  %208 = load float, float addrspace(3)* %207, align 4, !tbaa !7
  %209 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %206
  %210 = load float, float addrspace(3)* %209, align 4, !tbaa !7
  %211 = fadd contract float %208, %210
  store float %211, float addrspace(3)* %209, align 4, !tbaa !7
  br label %212

212:                                              ; preds = %205, %203
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %213 = icmp ult i32 %6, 511
  br i1 %213, label %214, label %220

214:                                              ; preds = %212
  %215 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %33
  %216 = load float, float addrspace(3)* %215, align 4, !tbaa !7
  %217 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %32
  %218 = load float, float addrspace(3)* %217, align 8, !tbaa !7
  %219 = fadd contract float %216, %218
  store float %219, float addrspace(3)* %217, align 8, !tbaa !7
  br label %220

220:                                              ; preds = %214, %212
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %15, label %221, label %226

221:                                              ; preds = %220
  %222 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %6
  %223 = load float, float addrspace(3)* %222, align 4, !tbaa !7
  %224 = sext i32 %14 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %1, i64 %224
  store float %223, float addrspace(1)* %225, align 4, !tbaa !7
  br label %226

226:                                              ; preds = %221, %220
  br i1 %23, label %227, label %233

227:                                              ; preds = %226
  %228 = add nuw nsw i32 %6, %12
  %229 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %228
  %230 = load float, float addrspace(3)* %229, align 4, !tbaa !7
  %231 = zext i32 %22 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %1, i64 %231
  store float %230, float addrspace(1)* %232, align 4, !tbaa !7
  br label %233

233:                                              ; preds = %227, %226
  %234 = icmp ne float addrspace(1)* %2, addrspacecast (float* null to float addrspace(1)*)
  %235 = icmp eq i32 %6, 0
  %236 = select i1 %234, i1 %235, i1 false
  br i1 %236, label %237, label %244

237:                                              ; preds = %233
  %238 = shl nuw nsw i32 %12, 1
  %239 = add nsw i32 %238, -1
  %240 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ4scanPfS_S_iE2XY, i32 0, i32 %239
  %241 = load float, float addrspace(3)* %240, align 4, !tbaa !7
  %242 = sext i32 %5 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %2, i64 %242
  store float %241, float addrspace(1)* %243, align 4, !tbaa !7
  br label %244

244:                                              ; preds = %237, %233
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
