; ModuleID = '../data/hip_kernels/7277/0/main.cu'
source_filename = "../data/hip_kernels/7277/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z24cudaProcessUnsignedChar0PhS_ii(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = shl nuw nsw i32 %5, 1
  %21 = add i32 %13, %20
  %22 = shl nuw nsw i32 %6, 1
  %23 = add i32 %19, %22
  %24 = mul nsw i32 %23, %2
  %25 = add nsw i32 %24, %21
  %26 = icmp sgt i32 %23, 0
  br i1 %26, label %27, label %35

27:                                               ; preds = %4
  %28 = add nsw i32 %3, -2
  %29 = icmp slt i32 %23, %28
  %30 = icmp sgt i32 %21, 0
  %31 = select i1 %29, i1 %30, i1 false
  %32 = add nsw i32 %2, -2
  %33 = icmp slt i32 %21, %32
  %34 = select i1 %31, i1 %33, i1 false
  br label %35

35:                                               ; preds = %27, %4
  %36 = phi i1 [ false, %4 ], [ %34, %27 ]
  %37 = sub nsw i32 %25, %2
  %38 = add nsw i32 %25, %2
  %39 = shl nsw i32 %2, 1
  %40 = add nsw i32 %25, %39
  br i1 %36, label %41, label %66

41:                                               ; preds = %35
  %42 = sext i32 %40 to i64
  %43 = add nsw i32 %40, -1
  %44 = sext i32 %43 to i64
  %45 = add nsw i32 %38, 2
  %46 = add nsw i32 %38, 1
  %47 = add nsw i32 %38, -1
  %48 = add nsw i32 %25, 2
  %49 = add nsw i32 %25, 1
  %50 = add nsw i32 %25, -1
  %51 = add nsw i32 %37, 2
  %52 = add nsw i32 %37, 1
  %53 = add nsw i32 %40, 1
  %54 = sext i32 %52 to i64
  %55 = sext i32 %25 to i64
  %56 = sext i32 %48 to i64
  %57 = sext i32 %47 to i64
  %58 = sext i32 %46 to i64
  %59 = sext i32 %50 to i64
  %60 = sext i32 %49 to i64
  %61 = sext i32 %53 to i64
  %62 = sext i32 %37 to i64
  %63 = sext i32 %51 to i64
  %64 = sext i32 %38 to i64
  %65 = sext i32 %45 to i64
  br label %66

66:                                               ; preds = %35, %41
  %67 = phi i64 [ 0, %35 ], [ %42, %41 ]
  %68 = phi i64 [ 0, %35 ], [ %44, %41 ]
  %69 = phi i64 [ 0, %35 ], [ %65, %41 ]
  %70 = phi i64 [ 0, %35 ], [ %58, %41 ]
  %71 = phi i64 [ 0, %35 ], [ %64, %41 ]
  %72 = phi i64 [ 0, %35 ], [ %57, %41 ]
  %73 = phi i64 [ 0, %35 ], [ %56, %41 ]
  %74 = phi i64 [ 0, %35 ], [ %60, %41 ]
  %75 = phi i64 [ 0, %35 ], [ %55, %41 ]
  %76 = phi i64 [ 0, %35 ], [ %59, %41 ]
  %77 = phi i64 [ 0, %35 ], [ %63, %41 ]
  %78 = phi i64 [ 0, %35 ], [ %54, %41 ]
  %79 = phi i64 [ 0, %35 ], [ %62, %41 ]
  %80 = phi i64 [ 0, %35 ], [ %61, %41 ]
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %78
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !6
  %83 = zext i8 %82 to i32
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %75
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !7, !amdgpu.noclobber !6
  %86 = zext i8 %85 to i32
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %73
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !7, !amdgpu.noclobber !6
  %89 = zext i8 %88 to i32
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %72
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !7, !amdgpu.noclobber !6
  %92 = zext i8 %91 to i32
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %70
  %94 = load i8, i8 addrspace(1)* %93, align 1, !tbaa !7, !amdgpu.noclobber !6
  %95 = zext i8 %94 to i32
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %67
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !7, !amdgpu.noclobber !6
  %98 = zext i8 %97 to i32
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %76
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !7, !amdgpu.noclobber !6
  %101 = zext i8 %100 to i32
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %74
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !7, !amdgpu.noclobber !6
  %104 = zext i8 %103 to i32
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %68
  %106 = load i8, i8 addrspace(1)* %105, align 1, !tbaa !7, !amdgpu.noclobber !6
  %107 = zext i8 %106 to i32
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %80
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !7, !amdgpu.noclobber !6
  %110 = zext i8 %109 to i32
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %79
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !7, !amdgpu.noclobber !6
  %113 = zext i8 %112 to i32
  %114 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %77
  %115 = load i8, i8 addrspace(1)* %114, align 1, !tbaa !7, !amdgpu.noclobber !6
  %116 = zext i8 %115 to i32
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %71
  %118 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !7, !amdgpu.noclobber !6
  %119 = zext i8 %118 to i32
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %69
  %121 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !7, !amdgpu.noclobber !6
  %122 = zext i8 %121 to i32
  %123 = add nuw nsw i32 %104, %101
  %124 = lshr i32 %123, 1
  %125 = add nuw nsw i32 %116, %113
  %126 = lshr i32 %125, 1
  %127 = add nuw nsw i32 %95, %86
  %128 = add nuw nsw i32 %127, %83
  %129 = add nuw nsw i32 %128, %89
  %130 = lshr i32 %129, 2
  %131 = add nuw nsw i32 %122, %119
  %132 = add nuw nsw i32 %131, %125
  %133 = lshr i32 %132, 2
  %134 = add nuw nsw i32 %123, %107
  %135 = add nuw nsw i32 %134, %110
  %136 = lshr i32 %135, 2
  %137 = add nuw nsw i32 %127, %92
  %138 = add nuw nsw i32 %137, %98
  %139 = lshr i32 %138, 2
  %140 = add nuw nsw i32 %110, %104
  %141 = lshr i32 %140, 1
  %142 = lshr i32 %131, 1
  %143 = mul nsw i32 %25, 3
  %144 = add nsw i32 %143, 3
  %145 = mul i32 %2, 3
  %146 = add i32 %143, %145
  %147 = add i32 %146, 3
  %148 = trunc i32 %124 to i8
  %149 = mul i32 %145, %3
  %150 = icmp slt i32 %143, %149
  %151 = select i1 %150, i32 %143, i32 0
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %152
  store i8 %148, i8 addrspace(1)* %153, align 1, !tbaa !7
  %154 = add nsw i32 %143, 1
  %155 = icmp slt i32 %154, %149
  %156 = select i1 %155, i32 %154, i32 0
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %157
  store i8 %85, i8 addrspace(1)* %158, align 1, !tbaa !7
  %159 = trunc i32 %126 to i8
  %160 = add nsw i32 %143, 2
  %161 = icmp slt i32 %160, %149
  %162 = select i1 %161, i32 %160, i32 0
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %163
  store i8 %159, i8 addrspace(1)* %164, align 1, !tbaa !7
  %165 = icmp slt i32 %144, %149
  %166 = select i1 %165, i32 %144, i32 0
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %167
  store i8 %103, i8 addrspace(1)* %168, align 1, !tbaa !7
  %169 = trunc i32 %130 to i8
  %170 = add nsw i32 %143, 4
  %171 = icmp slt i32 %170, %149
  %172 = select i1 %171, i32 %170, i32 0
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %173
  store i8 %169, i8 addrspace(1)* %174, align 1, !tbaa !7
  %175 = trunc i32 %133 to i8
  %176 = add nsw i32 %143, 5
  %177 = icmp slt i32 %176, %149
  %178 = select i1 %177, i32 %176, i32 0
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %179
  store i8 %175, i8 addrspace(1)* %180, align 1, !tbaa !7
  %181 = trunc i32 %136 to i8
  %182 = icmp slt i32 %146, %149
  %183 = select i1 %182, i32 %146, i32 0
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %184
  store i8 %181, i8 addrspace(1)* %185, align 1, !tbaa !7
  %186 = trunc i32 %139 to i8
  %187 = add nsw i32 %146, 1
  %188 = icmp slt i32 %187, %149
  %189 = select i1 %188, i32 %187, i32 0
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %190
  store i8 %186, i8 addrspace(1)* %191, align 1, !tbaa !7
  %192 = add nsw i32 %146, 2
  %193 = icmp slt i32 %192, %149
  %194 = select i1 %193, i32 %192, i32 0
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %195
  store i8 %118, i8 addrspace(1)* %196, align 1, !tbaa !7
  %197 = trunc i32 %141 to i8
  %198 = icmp slt i32 %147, %149
  %199 = select i1 %198, i32 %147, i32 0
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %200
  store i8 %197, i8 addrspace(1)* %201, align 1, !tbaa !7
  %202 = add i32 %146, 4
  %203 = icmp slt i32 %202, %149
  %204 = select i1 %203, i32 %202, i32 0
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %205
  store i8 %94, i8 addrspace(1)* %206, align 1, !tbaa !7
  %207 = trunc i32 %142 to i8
  %208 = add i32 %146, 5
  %209 = icmp slt i32 %208, %149
  %210 = select i1 %209, i32 %208, i32 0
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %211
  store i8 %207, i8 addrspace(1)* %212, align 1, !tbaa !7
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
