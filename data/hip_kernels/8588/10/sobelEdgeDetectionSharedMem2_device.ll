; ModuleID = '../data/hip_kernels/8588/10/main.cu'
source_filename = "../data/hip_kernels/8588/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z28sobelEdgeDetectionSharedMem2PiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = shl i32 %14, 1
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = shl i32 %23, 1
  %25 = icmp sgt i32 %15, 0
  %26 = icmp sgt i32 %24, 0
  %27 = select i1 %25, i1 %26, i1 false
  %28 = add nsw i32 %2, -1
  %29 = icmp slt i32 %15, %28
  %30 = select i1 %27, i1 %29, i1 false
  %31 = add nsw i32 %3, -1
  %32 = icmp slt i32 %24, %31
  %33 = select i1 %30, i1 %32, i1 false
  br i1 %33, label %34, label %189

34:                                               ; preds = %5
  %35 = add nsw i32 %24, -1
  %36 = mul nsw i32 %35, %2
  %37 = add nsw i32 %36, %15
  %38 = add nsw i32 %37, -1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = sext i32 %37 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = add nsw i32 %37, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = add nsw i32 %37, 2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = mul nsw i32 %24, %2
  %54 = add i32 %53, %15
  %55 = add nsw i32 %54, -1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = sext i32 %54 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = or i32 %54, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = add nsw i32 %54, 2
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = add nuw nsw i32 %24, 1
  %71 = mul nsw i32 %70, %2
  %72 = add nsw i32 %71, %15
  %73 = add nsw i32 %72, -1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = sext i32 %72 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = add nsw i32 %72, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = add nsw i32 %72, 2
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = add nuw nsw i32 %24, 2
  %89 = mul nsw i32 %88, %2
  %90 = add nsw i32 %89, %15
  %91 = add nsw i32 %90, -1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = sext i32 %90 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = or i32 %90, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = add nsw i32 %90, 2
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %106 = sub i32 %79, %44
  %107 = shl i32 %106, 1
  %108 = add i32 %76, %83
  %109 = add i32 %41, %48
  %110 = sub i32 %108, %109
  %111 = add i32 %110, %107
  %112 = sub i32 %58, %65
  %113 = shl i32 %112, 1
  %114 = add i32 %41, %76
  %115 = add i32 %83, %48
  %116 = sub i32 %114, %115
  %117 = add i32 %116, %113
  %118 = mul nsw i32 %111, %111
  %119 = mul nsw i32 %117, %117
  %120 = add nuw nsw i32 %119, %118
  %121 = icmp sgt i32 %120, %4
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %123 = select i1 %121, i32 255, i32 0
  store i32 %123, i32 addrspace(1)* %122, align 4, !tbaa !7
  %124 = sub i32 %83, %48
  %125 = shl i32 %124, 1
  %126 = add i32 %79, %87
  %127 = add i32 %44, %52
  %128 = sub i32 %126, %127
  %129 = add i32 %128, %125
  %130 = sub i32 %61, %69
  %131 = shl i32 %130, 1
  %132 = add i32 %44, %79
  %133 = add i32 %87, %52
  %134 = sub i32 %132, %133
  %135 = add i32 %134, %131
  %136 = mul nsw i32 %129, %129
  %137 = mul nsw i32 %135, %135
  %138 = add nuw nsw i32 %137, %136
  %139 = icmp sgt i32 %138, %4
  %140 = select i1 %139, i32 255, i32 0
  %141 = add nuw nsw i32 %24, 1
  %142 = mul nsw i32 %141, %2
  %143 = add i32 %15, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %144
  store i32 %140, i32 addrspace(1)* %145, align 4, !tbaa !7
  %146 = add nuw nsw i32 %15, 1
  %147 = sub i32 %97, %61
  %148 = shl i32 %147, 1
  %149 = add i32 %94, %101
  %150 = add i32 %58, %65
  %151 = sub i32 %149, %150
  %152 = add i32 %151, %148
  %153 = sub i32 %76, %83
  %154 = shl i32 %153, 1
  %155 = add i32 %58, %94
  %156 = add i32 %101, %65
  %157 = sub i32 %155, %156
  %158 = add i32 %157, %154
  %159 = mul nsw i32 %152, %152
  %160 = mul nsw i32 %158, %158
  %161 = add nuw nsw i32 %160, %159
  %162 = icmp sgt i32 %161, %4
  %163 = select i1 %162, i32 255, i32 0
  %164 = add i32 %146, %53
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %165
  store i32 %163, i32 addrspace(1)* %166, align 4, !tbaa !7
  %167 = sub i32 %101, %65
  %168 = shl i32 %167, 1
  %169 = add i32 %97, %105
  %170 = add i32 %61, %69
  %171 = sub i32 %169, %170
  %172 = add i32 %171, %168
  %173 = sub i32 %79, %87
  %174 = shl i32 %173, 1
  %175 = add i32 %61, %97
  %176 = add i32 %105, %69
  %177 = sub i32 %175, %176
  %178 = add i32 %177, %174
  %179 = mul nsw i32 %172, %172
  %180 = mul nsw i32 %178, %178
  %181 = add nuw nsw i32 %180, %179
  %182 = icmp sgt i32 %181, %4
  %183 = select i1 %182, i32 255, i32 0
  %184 = add nuw nsw i32 %24, 1
  %185 = mul nsw i32 %184, %2
  %186 = add i32 %146, %185
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %187
  store i32 %183, i32 addrspace(1)* %188, align 4, !tbaa !7
  br label %189

189:                                              ; preds = %34, %5
  ret void
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
