; ModuleID = '../data/hip_kernels/1507/33/main.cu'
source_filename = "../data/hip_kernels/1507/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = freeze i32 %20
  %22 = freeze i32 %3
  %23 = sdiv i32 %21, %22
  %24 = mul i32 %23, %22
  %25 = sub i32 %21, %24
  %26 = freeze i32 %4
  %27 = sdiv i32 %23, %26
  %28 = mul i32 %27, %26
  %29 = sub i32 %23, %28
  %30 = icmp slt i32 %27, %6
  br i1 %30, label %31, label %203

31:                                               ; preds = %11
  %32 = mul i32 %27, %4
  %33 = add i32 %32, %29
  %34 = mul i32 %33, %3
  %35 = add i32 %34, %25
  %36 = icmp sgt i32 %5, 0
  br i1 %36, label %37, label %191

37:                                               ; preds = %31
  %38 = mul nsw i32 %27, %9
  %39 = icmp sgt i32 %7, 0
  %40 = sub i32 %29, %8
  %41 = sub i32 %25, %8
  %42 = bitcast float addrspace(1)* %0 to i8 addrspace(1)*
  %43 = bitcast float addrspace(1)* %1 to i8 addrspace(1)*
  %44 = and i32 %7, 1
  %45 = icmp eq i32 %7, 1
  %46 = and i32 %7, -2
  %47 = icmp eq i32 %44, 0
  br label %48

48:                                               ; preds = %37, %186
  %49 = phi i32 [ 0, %37 ], [ %189, %186 ]
  %50 = phi i32 [ 0, %37 ], [ %188, %186 ]
  %51 = phi i32 [ 0, %37 ], [ %187, %186 ]
  %52 = mul i32 %49, %7
  %53 = mul i32 %49, %4
  br i1 %39, label %54, label %186

54:                                               ; preds = %48, %181
  %55 = phi i32 [ %184, %181 ], [ 0, %48 ]
  %56 = phi i32 [ %183, %181 ], [ %50, %48 ]
  %57 = phi i32 [ %182, %181 ], [ %51, %48 ]
  %58 = add i32 %40, %55
  %59 = icmp sgt i32 %58, -1
  %60 = icmp slt i32 %58, %4
  %61 = add i32 %58, %53
  %62 = mul i32 %61, %3
  %63 = add i32 %55, %52
  %64 = mul i32 %63, %7
  %65 = add i32 %64, %38
  br i1 %45, label %143, label %66

66:                                               ; preds = %54, %137
  %67 = phi i32 [ %140, %137 ], [ 0, %54 ]
  %68 = phi i32 [ %139, %137 ], [ %56, %54 ]
  %69 = phi i32 [ %138, %137 ], [ %57, %54 ]
  %70 = phi i32 [ %141, %137 ], [ 0, %54 ]
  %71 = add i32 %41, %67
  %72 = icmp sgt i32 %71, -1
  %73 = select i1 %59, i1 %72, i1 false
  %74 = select i1 %73, i1 %60, i1 false
  %75 = icmp slt i32 %71, %3
  %76 = select i1 %74, i1 %75, i1 false
  br i1 %76, label %77, label %102

77:                                               ; preds = %66
  %78 = add i32 %71, %62
  %79 = add i32 %65, %67
  %80 = sext i32 %78 to i64
  %81 = lshr i64 %80, 3
  %82 = and i32 %78, 7
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 %81
  %84 = load i8, i8 addrspace(1)* %83, align 1, !tbaa !7, !amdgpu.noclobber !5
  %85 = zext i8 %84 to i32
  %86 = shl nuw nsw i32 1, %82
  %87 = and i32 %86, %85
  %88 = icmp ne i32 %87, 0
  %89 = sext i32 %79 to i64
  %90 = lshr i64 %89, 3
  %91 = and i32 %79, 7
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %43, i64 %90
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !7, !amdgpu.noclobber !5
  %94 = zext i8 %93 to i32
  %95 = shl nuw nsw i32 1, %91
  %96 = and i32 %95, %94
  %97 = icmp eq i32 %96, 0
  %98 = xor i1 %88, %97
  %99 = zext i1 %98 to i32
  %100 = add nsw i32 %68, %99
  %101 = add nsw i32 %69, 1
  br label %102

102:                                              ; preds = %66, %77
  %103 = phi i32 [ %101, %77 ], [ %69, %66 ]
  %104 = phi i32 [ %100, %77 ], [ %68, %66 ]
  %105 = or i32 %67, 1
  %106 = add i32 %41, %105
  %107 = icmp sgt i32 %106, -1
  %108 = select i1 %59, i1 %107, i1 false
  %109 = select i1 %108, i1 %60, i1 false
  %110 = icmp slt i32 %106, %3
  %111 = select i1 %109, i1 %110, i1 false
  br i1 %111, label %112, label %137

112:                                              ; preds = %102
  %113 = add i32 %106, %62
  %114 = add i32 %65, %105
  %115 = sext i32 %113 to i64
  %116 = lshr i64 %115, 3
  %117 = and i32 %113, 7
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 %116
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !7, !amdgpu.noclobber !5
  %120 = zext i8 %119 to i32
  %121 = shl nuw nsw i32 1, %117
  %122 = and i32 %121, %120
  %123 = icmp ne i32 %122, 0
  %124 = sext i32 %114 to i64
  %125 = lshr i64 %124, 3
  %126 = and i32 %114, 7
  %127 = getelementptr inbounds i8, i8 addrspace(1)* %43, i64 %125
  %128 = load i8, i8 addrspace(1)* %127, align 1, !tbaa !7, !amdgpu.noclobber !5
  %129 = zext i8 %128 to i32
  %130 = shl nuw nsw i32 1, %126
  %131 = and i32 %130, %129
  %132 = icmp eq i32 %131, 0
  %133 = xor i1 %123, %132
  %134 = zext i1 %133 to i32
  %135 = add nsw i32 %104, %134
  %136 = add nsw i32 %103, 1
  br label %137

137:                                              ; preds = %112, %102
  %138 = phi i32 [ %136, %112 ], [ %103, %102 ]
  %139 = phi i32 [ %135, %112 ], [ %104, %102 ]
  %140 = add nuw nsw i32 %67, 2
  %141 = add i32 %70, 2
  %142 = icmp eq i32 %141, %46
  br i1 %142, label %143, label %66, !llvm.loop !10

143:                                              ; preds = %137, %54
  %144 = phi i32 [ undef, %54 ], [ %138, %137 ]
  %145 = phi i32 [ undef, %54 ], [ %139, %137 ]
  %146 = phi i32 [ 0, %54 ], [ %140, %137 ]
  %147 = phi i32 [ %56, %54 ], [ %139, %137 ]
  %148 = phi i32 [ %57, %54 ], [ %138, %137 ]
  br i1 %47, label %181, label %149

149:                                              ; preds = %143
  %150 = add i32 %41, %146
  %151 = icmp sgt i32 %150, -1
  %152 = select i1 %59, i1 %151, i1 false
  %153 = select i1 %152, i1 %60, i1 false
  %154 = icmp slt i32 %150, %3
  %155 = select i1 %153, i1 %154, i1 false
  br i1 %155, label %156, label %181

156:                                              ; preds = %149
  %157 = add i32 %150, %62
  %158 = add i32 %65, %146
  %159 = sext i32 %157 to i64
  %160 = lshr i64 %159, 3
  %161 = and i32 %157, 7
  %162 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 %160
  %163 = load i8, i8 addrspace(1)* %162, align 1, !tbaa !7, !amdgpu.noclobber !5
  %164 = zext i8 %163 to i32
  %165 = shl nuw nsw i32 1, %161
  %166 = and i32 %165, %164
  %167 = icmp ne i32 %166, 0
  %168 = sext i32 %158 to i64
  %169 = lshr i64 %168, 3
  %170 = and i32 %158, 7
  %171 = getelementptr inbounds i8, i8 addrspace(1)* %43, i64 %169
  %172 = load i8, i8 addrspace(1)* %171, align 1, !tbaa !7, !amdgpu.noclobber !5
  %173 = zext i8 %172 to i32
  %174 = shl nuw nsw i32 1, %170
  %175 = and i32 %174, %173
  %176 = icmp eq i32 %175, 0
  %177 = xor i1 %167, %176
  %178 = zext i1 %177 to i32
  %179 = add nsw i32 %147, %178
  %180 = add nsw i32 %148, 1
  br label %181

181:                                              ; preds = %149, %156, %143
  %182 = phi i32 [ %144, %143 ], [ %180, %156 ], [ %148, %149 ]
  %183 = phi i32 [ %145, %143 ], [ %179, %156 ], [ %147, %149 ]
  %184 = add nuw nsw i32 %55, 1
  %185 = icmp eq i32 %184, %7
  br i1 %185, label %186, label %54, !llvm.loop !12

186:                                              ; preds = %181, %48
  %187 = phi i32 [ %51, %48 ], [ %182, %181 ]
  %188 = phi i32 [ %50, %48 ], [ %183, %181 ]
  %189 = add nuw nsw i32 %49, 1
  %190 = icmp eq i32 %189, %5
  br i1 %190, label %191, label %48, !llvm.loop !13

191:                                              ; preds = %186, %31
  %192 = phi i32 [ 0, %31 ], [ %187, %186 ]
  %193 = phi i32 [ 0, %31 ], [ %188, %186 ]
  %194 = shl i32 %193, 1
  %195 = sub i32 %194, %192
  %196 = sitofp i32 %195 to float
  %197 = sext i32 %27 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %10, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !14, !amdgpu.noclobber !5
  %200 = fmul contract float %199, %196
  %201 = sext i32 %35 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %2, i64 %201
  store float %200, float addrspace(1)* %202, align 4, !tbaa !14
  br label %203

203:                                              ; preds = %191, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !8, i64 0}
