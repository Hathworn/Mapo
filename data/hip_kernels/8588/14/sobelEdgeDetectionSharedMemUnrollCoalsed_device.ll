; ModuleID = '../data/hip_kernels/8588/14/main.cu'
source_filename = "../data/hip_kernels/8588/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem = internal unnamed_addr addrspace(3) global [4096 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %6, 60
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = mul i32 %10, 60
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %13, %2
  %15 = add nsw i32 %9, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = shl nuw nsw i32 %12, 6
  %20 = add nuw nsw i32 %8, %19
  %21 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %20
  store i32 %18, i32 addrspace(3)* %21, align 4, !tbaa !5
  %22 = add nsw i32 %13, 30
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %9, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = shl nuw nsw i32 %12, 6
  %29 = add nuw nsw i32 %28, 1920
  %30 = add nuw nsw i32 %8, %29
  %31 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %30
  store i32 %27, i32 addrspace(3)* %31, align 4, !tbaa !5
  %32 = add nsw i32 %9, 30
  %33 = add nuw nsw i32 %8, 30
  %34 = add nsw i32 %32, %14
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = add nuw nsw i32 %33, %19
  %39 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %38
  store i32 %37, i32 addrspace(3)* %39, align 4, !tbaa !5
  %40 = add nsw i32 %32, %23
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !5, !amdgpu.noclobber !9
  %44 = add nuw nsw i32 %33, %29
  %45 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %44
  store i32 %43, i32 addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = add nsw i32 %2, -30
  %47 = icmp slt i32 %9, %46
  br i1 %47, label %48, label %236

48:                                               ; preds = %5
  %49 = add nsw i32 %3, -30
  %50 = icmp slt i32 %13, %49
  %51 = icmp ne i32 %8, 0
  %52 = select i1 %50, i1 %51, i1 false
  %53 = icmp ne i32 %12, 0
  %54 = select i1 %52, i1 %53, i1 false
  %55 = icmp ult i32 %8, 31
  %56 = select i1 %54, i1 %55, i1 false
  %57 = icmp ult i32 %12, 31
  %58 = select i1 %56, i1 %57, i1 false
  br i1 %58, label %59, label %236

59:                                               ; preds = %48
  %60 = add nuw nsw i32 %8, 1
  %61 = add nsw i32 %8, -1
  %62 = add nsw i32 %19, -64
  %63 = add nsw i32 %62, %60
  %64 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %63
  %65 = load i32, i32 addrspace(3)* %64, align 4, !tbaa !5
  %66 = add nsw i32 %62, %61
  %67 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %66
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %69 = add nuw nsw i32 %19, %60
  %70 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %69
  %71 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !5
  %72 = add nuw nsw i32 %19, %61
  %73 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %72
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !5
  %75 = add nuw nsw i32 %19, 64
  %76 = add nuw nsw i32 %75, %60
  %77 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %76
  %78 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !5
  %79 = add nuw nsw i32 %75, %61
  %80 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %79
  %81 = load i32, i32 addrspace(3)* %80, align 4, !tbaa !5
  %82 = sub i32 %71, %74
  %83 = shl i32 %82, 1
  %84 = add i32 %65, %78
  %85 = add i32 %68, %81
  %86 = sub i32 %84, %85
  %87 = add i32 %86, %83
  %88 = add nsw i32 %8, %62
  %89 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %88
  %90 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !5
  %91 = add nuw nsw i32 %8, %75
  %92 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %91
  %93 = load i32, i32 addrspace(3)* %92, align 4, !tbaa !5
  %94 = sub i32 %90, %93
  %95 = shl i32 %94, 1
  %96 = add i32 %68, %65
  %97 = add i32 %78, %81
  %98 = sub i32 %96, %97
  %99 = add i32 %98, %95
  %100 = mul nsw i32 %87, %87
  %101 = mul nsw i32 %99, %99
  %102 = add nuw nsw i32 %101, %100
  %103 = icmp sgt i32 %102, %4
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  %105 = select i1 %103, i32 255, i32 0
  store i32 %105, i32 addrspace(1)* %104, align 4, !tbaa !5
  %106 = add nuw nsw i32 %28, 1856
  %107 = add nuw nsw i32 %106, %60
  %108 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %107
  %109 = load i32, i32 addrspace(3)* %108, align 4, !tbaa !5
  %110 = add nuw nsw i32 %106, %61
  %111 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %110
  %112 = load i32, i32 addrspace(3)* %111, align 4, !tbaa !5
  %113 = add nuw nsw i32 %29, %60
  %114 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %113
  %115 = load i32, i32 addrspace(3)* %114, align 4, !tbaa !5
  %116 = add nuw nsw i32 %29, %61
  %117 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %116
  %118 = load i32, i32 addrspace(3)* %117, align 4, !tbaa !5
  %119 = add nuw nsw i32 %28, 1984
  %120 = add nuw nsw i32 %119, %60
  %121 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %120
  %122 = load i32, i32 addrspace(3)* %121, align 4, !tbaa !5
  %123 = add nuw nsw i32 %119, %61
  %124 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %123
  %125 = load i32, i32 addrspace(3)* %124, align 4, !tbaa !5
  %126 = sub i32 %115, %118
  %127 = shl i32 %126, 1
  %128 = add i32 %109, %122
  %129 = add i32 %112, %125
  %130 = sub i32 %128, %129
  %131 = add i32 %130, %127
  %132 = add nuw nsw i32 %8, %106
  %133 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %132
  %134 = load i32, i32 addrspace(3)* %133, align 4, !tbaa !5
  %135 = add nuw nsw i32 %8, %119
  %136 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %135
  %137 = load i32, i32 addrspace(3)* %136, align 4, !tbaa !5
  %138 = sub i32 %134, %137
  %139 = shl i32 %138, 1
  %140 = add i32 %112, %109
  %141 = add i32 %122, %125
  %142 = sub i32 %140, %141
  %143 = add i32 %142, %139
  %144 = mul nsw i32 %131, %131
  %145 = mul nsw i32 %143, %143
  %146 = add nuw nsw i32 %145, %144
  %147 = icmp sgt i32 %146, %4
  %148 = select i1 %147, i32 255, i32 0
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  store i32 %148, i32 addrspace(1)* %149, align 4, !tbaa !5
  %150 = add nuw nsw i32 %8, 31
  %151 = add nuw nsw i32 %8, 29
  %152 = add nsw i32 %62, %150
  %153 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %152
  %154 = load i32, i32 addrspace(3)* %153, align 4, !tbaa !5
  %155 = add nsw i32 %62, %151
  %156 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %155
  %157 = load i32, i32 addrspace(3)* %156, align 4, !tbaa !5
  %158 = add nuw nsw i32 %19, %150
  %159 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %158
  %160 = load i32, i32 addrspace(3)* %159, align 4, !tbaa !5
  %161 = add nuw nsw i32 %19, %151
  %162 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %161
  %163 = load i32, i32 addrspace(3)* %162, align 4, !tbaa !5
  %164 = add nuw nsw i32 %75, %150
  %165 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %164
  %166 = load i32, i32 addrspace(3)* %165, align 4, !tbaa !5
  %167 = add nuw nsw i32 %75, %151
  %168 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %167
  %169 = load i32, i32 addrspace(3)* %168, align 4, !tbaa !5
  %170 = sub i32 %160, %163
  %171 = shl i32 %170, 1
  %172 = add i32 %154, %166
  %173 = add i32 %157, %169
  %174 = sub i32 %172, %173
  %175 = add i32 %174, %171
  %176 = add nsw i32 %33, %62
  %177 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %176
  %178 = load i32, i32 addrspace(3)* %177, align 4, !tbaa !5
  %179 = add nuw nsw i32 %33, %75
  %180 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %179
  %181 = load i32, i32 addrspace(3)* %180, align 4, !tbaa !5
  %182 = sub i32 %178, %181
  %183 = shl i32 %182, 1
  %184 = add i32 %157, %154
  %185 = add i32 %166, %169
  %186 = sub i32 %184, %185
  %187 = add i32 %186, %183
  %188 = mul nsw i32 %175, %175
  %189 = mul nsw i32 %187, %187
  %190 = add nuw nsw i32 %189, %188
  %191 = icmp sgt i32 %190, %4
  %192 = select i1 %191, i32 255, i32 0
  %193 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  store i32 %192, i32 addrspace(1)* %193, align 4, !tbaa !5
  %194 = add nuw nsw i32 %106, %150
  %195 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %194
  %196 = load i32, i32 addrspace(3)* %195, align 4, !tbaa !5
  %197 = add nuw nsw i32 %106, %151
  %198 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %197
  %199 = load i32, i32 addrspace(3)* %198, align 4, !tbaa !5
  %200 = add nuw nsw i32 %29, %150
  %201 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %200
  %202 = load i32, i32 addrspace(3)* %201, align 4, !tbaa !5
  %203 = add nuw nsw i32 %29, %151
  %204 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %203
  %205 = load i32, i32 addrspace(3)* %204, align 4, !tbaa !5
  %206 = add nuw nsw i32 %119, %150
  %207 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %206
  %208 = load i32, i32 addrspace(3)* %207, align 4, !tbaa !5
  %209 = add nuw nsw i32 %119, %151
  %210 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %209
  %211 = load i32, i32 addrspace(3)* %210, align 4, !tbaa !5
  %212 = sub i32 %202, %205
  %213 = shl i32 %212, 1
  %214 = add i32 %196, %208
  %215 = add i32 %199, %211
  %216 = sub i32 %214, %215
  %217 = add i32 %216, %213
  %218 = add nuw nsw i32 %33, %106
  %219 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %218
  %220 = load i32, i32 addrspace(3)* %219, align 4, !tbaa !5
  %221 = add nuw nsw i32 %33, %119
  %222 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ40sobelEdgeDetectionSharedMemUnrollCoalsedPiS_iiiE5shMem, i32 0, i32 %221
  %223 = load i32, i32 addrspace(3)* %222, align 4, !tbaa !5
  %224 = sub i32 %220, %223
  %225 = shl i32 %224, 1
  %226 = add i32 %199, %196
  %227 = add i32 %208, %211
  %228 = sub i32 %226, %227
  %229 = add i32 %228, %225
  %230 = mul nsw i32 %217, %217
  %231 = mul nsw i32 %229, %229
  %232 = add nuw nsw i32 %231, %230
  %233 = icmp sgt i32 %232, %4
  %234 = select i1 %233, i32 255, i32 0
  %235 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  store i32 %234, i32 addrspace(1)* %235, align 4, !tbaa !5
  br label %236

236:                                              ; preds = %59, %48, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
