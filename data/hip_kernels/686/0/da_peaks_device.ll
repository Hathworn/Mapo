; ModuleID = '../data/hip_kernels/686/0/main.cu'
source_filename = "../data/hip_kernels/686/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8da_peaksPffiii(float addrspace(1)* nocapture %0, float %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %6
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %24 = icmp slt i32 %23, %4
  %25 = icmp sgt i32 %15, 1
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %202

27:                                               ; preds = %5
  %28 = add nsw i32 %2, -2
  %29 = icmp slt i32 %15, %28
  %30 = icmp sgt i32 %22, 1
  %31 = select i1 %29, i1 %30, i1 false
  %32 = add nsw i32 %3, -2
  %33 = icmp slt i32 %22, %32
  %34 = select i1 %31, i1 %33, i1 false
  br i1 %34, label %35, label %202

35:                                               ; preds = %27
  %36 = mul i32 %23, %3
  %37 = add i32 %36, -2
  %38 = add i32 %37, %22
  %39 = add nsw i32 %15, -2
  %40 = mul i32 %38, %2
  %41 = add i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  %45 = add i32 %38, 1
  %46 = mul i32 %45, %2
  %47 = add i32 %39, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !6
  %51 = add i32 %36, %22
  %52 = mul i32 %51, %2
  %53 = add i32 %39, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !6
  %57 = add i32 %38, 3
  %58 = mul i32 %57, %2
  %59 = add i32 %39, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = add i32 %38, 4
  %64 = mul i32 %63, %2
  %65 = add i32 %39, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !6
  %69 = add nsw i32 %15, -1
  %70 = add i32 %69, %40
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  %74 = add i32 %69, %46
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !6
  %78 = add i32 %69, %52
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = add i32 %69, %58
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !6
  %86 = add i32 %69, %64
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !6
  %90 = add i32 %15, %40
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = add i32 %15, %46
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = add i32 %15, %52
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !6
  %102 = add i32 %15, %58
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = add i32 %15, %64
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = add nuw nsw i32 %15, 1
  %111 = add i32 %110, %40
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !6
  %115 = add i32 %110, %46
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !6
  %119 = add i32 %110, %52
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !6
  %123 = add i32 %110, %58
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = add i32 %110, %64
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !6
  %131 = add nuw i32 %15, 2
  %132 = add i32 %131, %40
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !6
  %136 = add i32 %131, %46
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !6
  %140 = add i32 %131, %52
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !6
  %144 = add i32 %131, %58
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !6
  %148 = add i32 %131, %64
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !6
  %152 = fcmp contract uge float %101, %1
  %153 = fcmp contract ule float %44, %101
  %154 = fcmp contract ule float %50, %101
  %155 = fcmp contract ule float %56, %101
  %156 = fcmp contract ule float %62, %101
  %157 = fcmp contract ule float %68, %101
  %158 = fcmp contract ule float %73, %101
  %159 = fcmp contract ule float %77, %101
  %160 = fcmp contract ule float %81, %101
  %161 = fcmp contract ule float %85, %101
  %162 = fcmp contract ule float %89, %101
  %163 = fcmp contract ule float %93, %101
  %164 = fcmp contract ule float %97, %101
  %165 = fcmp contract ule float %105, %101
  %166 = fcmp contract ule float %109, %101
  %167 = fcmp contract ule float %114, %101
  %168 = fcmp contract ule float %118, %101
  %169 = fcmp contract ule float %122, %101
  %170 = fcmp contract ule float %126, %101
  %171 = fcmp contract ule float %130, %101
  %172 = fcmp contract ule float %135, %101
  %173 = fcmp contract ule float %139, %101
  %174 = fcmp contract ule float %143, %101
  %175 = fcmp contract ule float %147, %101
  %176 = fcmp contract ule float %151, %101
  %177 = select i1 %176, i1 %175, i1 false
  %178 = select i1 %177, i1 %174, i1 false
  %179 = select i1 %178, i1 %173, i1 false
  %180 = select i1 %179, i1 %172, i1 false
  %181 = select i1 %180, i1 %171, i1 false
  %182 = select i1 %181, i1 %170, i1 false
  %183 = select i1 %182, i1 %169, i1 false
  %184 = select i1 %183, i1 %168, i1 false
  %185 = select i1 %184, i1 %167, i1 false
  %186 = select i1 %185, i1 %166, i1 false
  %187 = select i1 %186, i1 %165, i1 false
  %188 = select i1 %187, i1 %164, i1 false
  %189 = select i1 %188, i1 %163, i1 false
  %190 = select i1 %189, i1 %162, i1 false
  %191 = select i1 %190, i1 %161, i1 false
  %192 = select i1 %191, i1 %160, i1 false
  %193 = select i1 %192, i1 %159, i1 false
  %194 = select i1 %193, i1 %158, i1 false
  %195 = select i1 %194, i1 %157, i1 false
  %196 = select i1 %195, i1 %156, i1 false
  %197 = select i1 %196, i1 %155, i1 false
  %198 = select i1 %197, i1 %154, i1 false
  %199 = select i1 %198, i1 %153, i1 false
  %200 = select i1 %199, i1 %152, i1 false
  %201 = uitofp i1 %200 to float
  br label %205

202:                                              ; preds = %27, %5
  br i1 %24, label %203, label %213

203:                                              ; preds = %202
  %204 = mul i32 %23, %3
  br label %205

205:                                              ; preds = %35, %203
  %206 = phi i32 [ %204, %203 ], [ %36, %35 ]
  %207 = phi float [ 0.000000e+00, %203 ], [ %201, %35 ]
  %208 = add i32 %22, %206
  %209 = mul i32 %208, %2
  %210 = add i32 %209, %15
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %0, i64 %211
  store float %207, float addrspace(1)* %212, align 4, !tbaa !7
  br label %213

213:                                              ; preds = %205, %202
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
