; ModuleID = '../data/hip_kernels/820/18/main.cu'
source_filename = "../data/hip_kernels/820/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18second_calculationPcS_S_iii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %5
  br i1 %16, label %17, label %226

17:                                               ; preds = %6
  %18 = mul nsw i32 %5, %3
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %5
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %21
  %23 = load i8, i8 addrspace(1)* %22, align 1, !tbaa !7, !amdgpu.noclobber !5
  %24 = icmp slt i8 %23, 5
  %25 = icmp sgt i32 %5, 0
  br i1 %24, label %32, label %26

26:                                               ; preds = %17
  br i1 %25, label %27, label %226

27:                                               ; preds = %26
  %28 = and i32 %5, 7
  %29 = icmp ult i32 %5, 8
  br i1 %29, label %209, label %30

30:                                               ; preds = %27
  %31 = and i32 %5, -8
  br label %115

32:                                               ; preds = %17
  br i1 %25, label %33, label %226

33:                                               ; preds = %32
  %34 = and i32 %5, 7
  %35 = icmp ult i32 %5, 8
  br i1 %35, label %192, label %36

36:                                               ; preds = %33
  %37 = and i32 %5, -8
  br label %38

38:                                               ; preds = %38, %36
  %39 = phi i32 [ 0, %36 ], [ %112, %38 ]
  %40 = phi i32 [ 0, %36 ], [ %113, %38 ]
  %41 = add nsw i32 %39, %20
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %42
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !7
  %47 = add i8 %46, %44
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %42
  store i8 %47, i8 addrspace(1)* %48, align 1, !tbaa !7
  %49 = or i32 %39, 1
  %50 = add nsw i32 %49, %20
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %51
  %53 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !7
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %51
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !7
  %56 = add i8 %55, %53
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %51
  store i8 %56, i8 addrspace(1)* %57, align 1, !tbaa !7
  %58 = or i32 %39, 2
  %59 = add nsw i32 %58, %20
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %60
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !7
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %60
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !7
  %65 = add i8 %64, %62
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %60
  store i8 %65, i8 addrspace(1)* %66, align 1, !tbaa !7
  %67 = or i32 %39, 3
  %68 = add nsw i32 %67, %20
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !7
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %69
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !7
  %74 = add i8 %73, %71
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %69
  store i8 %74, i8 addrspace(1)* %75, align 1, !tbaa !7
  %76 = or i32 %39, 4
  %77 = add nsw i32 %76, %20
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !7
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %78
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7
  %83 = add i8 %82, %80
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %78
  store i8 %83, i8 addrspace(1)* %84, align 1, !tbaa !7
  %85 = or i32 %39, 5
  %86 = add nsw i32 %85, %20
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %87
  %89 = load i8, i8 addrspace(1)* %88, align 1, !tbaa !7
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %87
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !7
  %92 = add i8 %91, %89
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %87
  store i8 %92, i8 addrspace(1)* %93, align 1, !tbaa !7
  %94 = or i32 %39, 6
  %95 = add nsw i32 %94, %20
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %96
  %98 = load i8, i8 addrspace(1)* %97, align 1, !tbaa !7
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %96
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !7
  %101 = add i8 %100, %98
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %96
  store i8 %101, i8 addrspace(1)* %102, align 1, !tbaa !7
  %103 = or i32 %39, 7
  %104 = add nsw i32 %103, %20
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %105
  %107 = load i8, i8 addrspace(1)* %106, align 1, !tbaa !7
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %105
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !7
  %110 = add i8 %109, %107
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %105
  store i8 %110, i8 addrspace(1)* %111, align 1, !tbaa !7
  %112 = add nuw nsw i32 %39, 8
  %113 = add i32 %40, 8
  %114 = icmp eq i32 %113, %37
  br i1 %114, label %192, label %38, !llvm.loop !10

115:                                              ; preds = %115, %30
  %116 = phi i32 [ 0, %30 ], [ %189, %115 ]
  %117 = phi i32 [ 0, %30 ], [ %190, %115 ]
  %118 = add nsw i32 %116, %20
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %119
  %121 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !7
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %119
  %123 = load i8, i8 addrspace(1)* %122, align 1, !tbaa !7
  %124 = sub i8 %121, %123
  %125 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %119
  store i8 %124, i8 addrspace(1)* %125, align 1, !tbaa !7
  %126 = or i32 %116, 1
  %127 = add nsw i32 %126, %20
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %128
  %130 = load i8, i8 addrspace(1)* %129, align 1, !tbaa !7
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %128
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !7
  %133 = sub i8 %130, %132
  %134 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %128
  store i8 %133, i8 addrspace(1)* %134, align 1, !tbaa !7
  %135 = or i32 %116, 2
  %136 = add nsw i32 %135, %20
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %137
  %139 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !7
  %140 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %137
  %141 = load i8, i8 addrspace(1)* %140, align 1, !tbaa !7
  %142 = sub i8 %139, %141
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %137
  store i8 %142, i8 addrspace(1)* %143, align 1, !tbaa !7
  %144 = or i32 %116, 3
  %145 = add nsw i32 %144, %20
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %146
  %148 = load i8, i8 addrspace(1)* %147, align 1, !tbaa !7
  %149 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %146
  %150 = load i8, i8 addrspace(1)* %149, align 1, !tbaa !7
  %151 = sub i8 %148, %150
  %152 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %146
  store i8 %151, i8 addrspace(1)* %152, align 1, !tbaa !7
  %153 = or i32 %116, 4
  %154 = add nsw i32 %153, %20
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %155
  %157 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !7
  %158 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %155
  %159 = load i8, i8 addrspace(1)* %158, align 1, !tbaa !7
  %160 = sub i8 %157, %159
  %161 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %155
  store i8 %160, i8 addrspace(1)* %161, align 1, !tbaa !7
  %162 = or i32 %116, 5
  %163 = add nsw i32 %162, %20
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %164
  %166 = load i8, i8 addrspace(1)* %165, align 1, !tbaa !7
  %167 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %164
  %168 = load i8, i8 addrspace(1)* %167, align 1, !tbaa !7
  %169 = sub i8 %166, %168
  %170 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %164
  store i8 %169, i8 addrspace(1)* %170, align 1, !tbaa !7
  %171 = or i32 %116, 6
  %172 = add nsw i32 %171, %20
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %173
  %175 = load i8, i8 addrspace(1)* %174, align 1, !tbaa !7
  %176 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %173
  %177 = load i8, i8 addrspace(1)* %176, align 1, !tbaa !7
  %178 = sub i8 %175, %177
  %179 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %173
  store i8 %178, i8 addrspace(1)* %179, align 1, !tbaa !7
  %180 = or i32 %116, 7
  %181 = add nsw i32 %180, %20
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %182
  %184 = load i8, i8 addrspace(1)* %183, align 1, !tbaa !7
  %185 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %182
  %186 = load i8, i8 addrspace(1)* %185, align 1, !tbaa !7
  %187 = sub i8 %184, %186
  %188 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %182
  store i8 %187, i8 addrspace(1)* %188, align 1, !tbaa !7
  %189 = add nuw nsw i32 %116, 8
  %190 = add i32 %117, 8
  %191 = icmp eq i32 %190, %31
  br i1 %191, label %209, label %115, !llvm.loop !12

192:                                              ; preds = %38, %33
  %193 = phi i32 [ 0, %33 ], [ %112, %38 ]
  %194 = icmp eq i32 %34, 0
  br i1 %194, label %226, label %195

195:                                              ; preds = %192, %195
  %196 = phi i32 [ %206, %195 ], [ %193, %192 ]
  %197 = phi i32 [ %207, %195 ], [ 0, %192 ]
  %198 = add nsw i32 %196, %20
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %199
  %201 = load i8, i8 addrspace(1)* %200, align 1, !tbaa !7
  %202 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %199
  %203 = load i8, i8 addrspace(1)* %202, align 1, !tbaa !7
  %204 = add i8 %203, %201
  %205 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %199
  store i8 %204, i8 addrspace(1)* %205, align 1, !tbaa !7
  %206 = add nuw nsw i32 %196, 1
  %207 = add i32 %197, 1
  %208 = icmp eq i32 %207, %34
  br i1 %208, label %226, label %195, !llvm.loop !13

209:                                              ; preds = %115, %27
  %210 = phi i32 [ 0, %27 ], [ %189, %115 ]
  %211 = icmp eq i32 %28, 0
  br i1 %211, label %226, label %212

212:                                              ; preds = %209, %212
  %213 = phi i32 [ %223, %212 ], [ %210, %209 ]
  %214 = phi i32 [ %224, %212 ], [ 0, %209 ]
  %215 = add nsw i32 %213, %20
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %216
  %218 = load i8, i8 addrspace(1)* %217, align 1, !tbaa !7
  %219 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %216
  %220 = load i8, i8 addrspace(1)* %219, align 1, !tbaa !7
  %221 = sub i8 %218, %220
  %222 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %216
  store i8 %221, i8 addrspace(1)* %222, align 1, !tbaa !7
  %223 = add nuw nsw i32 %213, 1
  %224 = add i32 %214, 1
  %225 = icmp eq i32 %224, %28
  br i1 %225, label %226, label %212, !llvm.loop !15

226:                                              ; preds = %209, %212, %192, %195, %26, %32, %6
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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !14}
